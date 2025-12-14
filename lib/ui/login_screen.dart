import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32), // To wrap the column with padding 32
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  // To vertically center the column
          children: <Widget>[
            const Text(
              "Sistema de Gestão de Contas",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
              ),),
            TextFormField(
              decoration: InputDecoration(
                label: Text("E-mail"),  // placeholder
              ),
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                label: Text("Senha"),  // placeholder
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Entrar"),
            ),
          ],
        ),
      ),
    );
  }
}