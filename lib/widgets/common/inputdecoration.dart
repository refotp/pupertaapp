import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:ktaapp/constants/colorconst.dart';

InputDecoration textFieldDecoration(String label) {
  return InputDecoration(
      filled: true,
      fillColor: ColorConst.sekunder.withOpacity(0.2),
      constraints: BoxConstraints(maxHeight: 100.h),
      labelText: label,
      labelStyle: TextStyle(
        color: ColorConst.tersier.withOpacity(0.5),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(style: BorderStyle.none),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(style: BorderStyle.none),
        borderRadius: BorderRadius.circular(12),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.black26),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red),
      ),
      contentPadding: const EdgeInsets.only(
        top: 20,
        left: 16,
        bottom: 20,
      ));
}

InputDecoration passwordFieldDecoration() {
  return InputDecoration(
      constraints: BoxConstraints(maxHeight: 100.h),
      labelText: 'kuDAlautberKeP4LaB4dak14',
      labelStyle: TextStyle(
        color: Colors.blue.withOpacity(0.5),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.blue, width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black26),
        borderRadius: BorderRadius.circular(12),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.black26),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red),
      ),
      prefixIcon: Icon(
        Ionicons.lock_closed_outline,
        color: Colors.amber[800],
      ),
      contentPadding: const EdgeInsets.only(
        top: 20,
        left: 16,
        bottom: 20,
      ));
}
