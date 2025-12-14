import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/models/account.dart';
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
      body: AccountWidget(
        account: Account(
          id: "001",
          name: "name",
          lastName: "lastName",
          balance: 200,
          accountType: null,
        ),
      ),
    );
  }
}
