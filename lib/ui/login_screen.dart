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
          crossAxisAlignment: CrossAxisAlignment.stretch, // To stretch the components, button in this case, to maximum width
          children: <Widget>[
            const Text(
              "Sistema de Gestão de Contas",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
              ),),
            const SizedBox(height: 32),
            TextFormField(
              decoration: InputDecoration(
                label: Text("E-mail"),  // placeholder
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                label: Text("Senha"),  // placeholder
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Color(0xFFFFA902)
                ), // A value of FF before the color code means the color is 100% opaque (not transparent at all).
              ),
              child: const Text(
                "Entrar", 
                style: TextStyle(color: Colors.black,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}