import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/ui/styles/colors.dart';

class AddAccountModal extends StatelessWidget {
  const AddAccountModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // This padding configuration prevents the keyboard to appear over the form fileds components when editing.
      padding: EdgeInsets.only(
        left: 32,
        right: 32,
        top: 32,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      height:
          MediaQuery.of(context).size.height *
          0.75, // It depends on the property 'isScrollControlled: true' on the Widget who calls the modal,
      child: SingleChildScrollView(
        // To make its child to be able to scroll
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Image.asset(
                "assets/images/icon_add_account.png",
                width: 64,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Adicionar nova conta",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 8),
            Text(
              "Preencha os dados abaixo:",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            TextFormField(decoration: InputDecoration(label: Text("Nome"))),
            TextFormField(
              decoration: InputDecoration(label: Text("Ultimo nome")),
            ),
            SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  //The widget Expanded expands the elements to the maximum width, since we can not use CrossAxisAlignment.stretch for the row, in this case.
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Cancelar",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(AppColor.orange),
                    ),
                    child: Text(
                      "Adicionar",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
