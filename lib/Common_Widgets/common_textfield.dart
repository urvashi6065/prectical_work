import 'package:flutter/material.dart';

class CommonTextfield extends StatelessWidget {
  final String labText;
  final IconData iconsP;
  final TextEditingController controler;
  final String validator;
  const CommonTextfield(
      {super.key,
      required this.labText,
      required this.iconsP,
      required this.controler,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controler,
      validator: (value) {
        if (value!.isEmpty) {
          return validator;
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: labText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          prefixIcon: Icon(iconsP)),
    );
  }
}
