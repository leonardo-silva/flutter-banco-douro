import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/models/account.dart';
import 'package:flutter_banco_douro/services/account_service.dart';
import 'package:flutter_banco_douro/ui/widgets/account_widget.dart';
import '../ui/styles/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.lightGrey,
        title: Text("Sistema de gestão de contas"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, "login");
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: AccountService().getAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                // It has not started
                return Center(child: CircularProgressIndicator());
              case ConnectionState.waiting:
                // It has started but it is not ready yet
                return Center(child: CircularProgressIndicator());
              case ConnectionState.active:
                // Usually for streams, that remain active.
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                {
                  if (snapshot.data == null || snapshot.data!.isEmpty) {
                    return Center(child: Text("Nenhuma contra encontrada."));
                  } else {
                    List<Account> listAccounts = snapshot.data!;
                    return ListView.builder(
                      itemCount: listAccounts.length,
                      itemBuilder: (context, index) {
                        return AccountWidget(
                          account: listAccounts.elementAt(index),
                        );
                      },
                    );
                  }
                }
            }
          },
        ),
      ),
    );
  }
}
