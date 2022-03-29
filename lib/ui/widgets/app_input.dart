import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final String initialValue, labelText;
  final void Function(String) onChanged;
  final Color color;
  const AppInput({
    Key? key,
    required this.initialValue,
    required this.onChanged,
    required this.labelText, this.color = Colors.white,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      style: TextStyle(color: color),
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.grey[500]),
          focusedBorder:  UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
          enabledBorder:  UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          )),
    );
  }
}
