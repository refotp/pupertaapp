import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ktaapp/constants/colorconst.dart';
import 'package:ktaapp/helper/validator.dart';

class NomorPensiun extends StatelessWidget {
  const NomorPensiun({
    super.key,
    required this.maxLength,
    required this.controller,
    required this.isSix,
  });
  final int maxLength;
  final TextEditingController controller;
  final bool isSix;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: !isSix ? 38 : 78,
      height: 64,
      child: TextFormField(
        validator: (value) =>
            Validator.validateEmptyText('Nama Lengkap', value),
        controller: controller,
        onChanged: (value) {
          if (value.length == maxLength) {
            controller.text = value;
            FocusScope.of(context).nextFocus();
          }
        },
        cursorColor: ColorConst.tersier,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            filled: true,
            fillColor: ColorConst.sekunder.withOpacity(0.25),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none),
            contentPadding: const EdgeInsets.all(8),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none)),
        style: const TextStyle(
          color: ColorConst.tersier,
          fontSize: 16,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxLength),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
