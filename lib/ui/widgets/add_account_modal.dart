import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/models/account.dart';
import 'package:flutter_banco_douro/services/account_service.dart';
import 'package:flutter_banco_douro/ui/styles/colors.dart';
import 'package:uuid/uuid.dart';

class AddAccountModal extends StatefulWidget {
  // It was necessary to change this widget para Stateful after the creation of _accountType, because now it has a state that changes.
  const AddAccountModal({super.key});

  @override
  State<AddAccountModal> createState() => _AddAccountModalState();
}

class _AddAccountModalState extends State<AddAccountModal> {
  String _accountType = "AMBROSIA";

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  bool isLoading = false;

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
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(label: Text("Nome")),
            ),
            TextFormField(
              controller: _lastNameController,
              decoration: InputDecoration(label: Text("Ultimo nome")),
            ),
            SizedBox(height: 16),
            Text("Tipo da conta"),
            DropdownButton<String>(
              value: _accountType,
              isExpanded:
                  true, // to make the little arrow of the dropdown to go to the end, not next to the value
              items: [
                DropdownMenuItem(value: "AMBROSIA", child: Text("Ambrosia")),
                DropdownMenuItem(value: "CANJICA", child: Text("Canjica")),
                DropdownMenuItem(value: "PUDIM", child: Text("Pudim")),
                DropdownMenuItem(
                  value: "BRIGADEIRO",
                  child: Text("Brigadeiro"),
                ),
              ],
              onChanged: (newValue) {
                if (newValue != null) {
                  setState(() {
                    _accountType = newValue;
                  });
                }
              },
            ),
            SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  //The widget Expanded expands the elements to the maximum width, since we can not use CrossAxisAlignment.stretch for the row, in this case.
                  child: ElevatedButton(
                    // If onPressed == null it means that the button will be disabled
                    onPressed: (isLoading)
                        ? null
                        : () {
                            onClickButtonCancel();
                          },
                    child: Text(
                      "Cancelar",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      onClickButtonSend();
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(AppColor.orange),
                    ),
                    child: (isLoading)
                        ? SizedBox(
                            height: 16,
                            width: 16,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
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

  onClickButtonCancel() {
    if (!isLoading) {
      closeModal();
    }
  }

  onClickButtonSend() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

      String name = _nameController.text;
      String lastName = _lastNameController.text;

      Account account = Account(
        id: Uuid().v1(),
        name: name,
        lastName: lastName,
        balance: 0,
        accountType: _accountType,
      );

      await AccountService().addAccount(account);

      closeModal();
    }
  }

  void closeModal() {
    Navigator.pop(context);
  }
}
