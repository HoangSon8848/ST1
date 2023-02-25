import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../resource/app_font.dart';

class FormPrimary extends StatelessWidget {
  const FormPrimary({
    Key? key,
    required this.keys,
    required this.controller,
    this.validator,
    required this.prefixText,
    required this.hintText,
    this.onChanged,
  }) : super(key: key);
  final Key? keys;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String prefixText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Form(
        key: keys,
        child: TextFormField(
          controller: controller,
          validator: validator,
          onChanged: onChanged,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            prefixText: prefixText,
            hintText: hintText,
            hintStyle: AppFonts.text16grey400,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        ),
      );
    });
  }
}
