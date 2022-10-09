import 'package:flutter/material.dart';
import 'package:reward_yourself/components/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Senha",
          icon: Icon(
            Icons.lock,
            color: Color(0xFFFDA951),
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: Color(0xFFFDA951),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
