import 'package:flutter/material.dart';

class AddAccountModal extends StatelessWidget {
  const AddAccountModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          MediaQuery.of(context).size.height *
          0.75, // It depends on the property 'isScrollControlled: true' on the Widget who calls the modal,
    );
  }
}
