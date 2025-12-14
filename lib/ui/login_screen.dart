import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/ui/styles/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/banner.png"),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset("assets/images/stars.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(32), // To wrap the column with padding 32
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,  // To vertically center the column
              children: <Widget>[
                const SizedBox(height: 190),
                Image.asset(
                  "assets/images/logo.png", 
                  width: 100,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch, // To stretch the components, button in this case, to maximum width
                  children: [
                    const SizedBox(height: 24),
                    const Text(
                      "Sistema de Gestão de Contas",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                      ),),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text("E-mail"),  // placeholder
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        label: Text("Senha"),  // placeholder
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "home");
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          AppColor.orange
                        ), // A value of FF before the color code means the color is 100% opaque (not transparent at all).
                      ),
                      child: const Text(
                        "Entrar", 
                        style: TextStyle(color: Colors.black,),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}