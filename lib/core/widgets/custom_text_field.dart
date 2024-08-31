import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomTextField extends StatelessWidget {
  final String name;
  final String? hintText;
  const CustomTextField({super.key, required this.name, this.hintText});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      decoration: InputDecoration(
        hintText: hintText,
        labelStyle: const TextStyle(
          color: Color(0xFF616161),
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          height: 0,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Color(0xFF1F41BB)),
          borderRadius: BorderRadius.circular(10),
        ),
        border: InputBorder.none,
        fillColor: const Color(0xFFF1F4FF),
        filled: true,
      ),
    );
  }
}
