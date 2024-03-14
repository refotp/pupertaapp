import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class FirebaseAuthErrorHandling {
  static FirebaseAuthErrorHandling get instance => FirebaseAuthErrorHandling();
  static SnackbarController phoneNumberAlreadyExists() {
    return Get.snackbar(
      '',
      '',
      duration: const Duration(seconds: 3),
      snackPosition: SnackPosition.BOTTOM,
      icon: const Icon(
        Ionicons.warning,
        color: Colors.white,
      ),
      backgroundColor: Colors.red,
      colorText: Colors.white,
      titleText: const Text(
        'Error',
        style: TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      ),
      messageText: const Text(
        'Nomor HP ini sudah terdaftar',
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }

  static SnackbarController emailAlreadyExists() {
    return Get.snackbar(
      '',
      '',
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
      icon: const Icon(
        Ionicons.warning,
        color: Colors.white,
      ),
      backgroundColor: Colors.red,
      colorText: Colors.white,
      titleText: const Text(
        'Error',
        style: TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      ),
      messageText: const Text(
        'Email sudah terdaftar, gunakan email lain',
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }

  static SnackbarController invalidEmail() {
    return Get.snackbar(
      '',
      '',
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
      icon: const Icon(
        Ionicons.warning,
        color: Colors.white,
      ),
      backgroundColor: Colors.red,
      colorText: Colors.white,
      titleText: const Text(
        'Error',
        style: TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      ),
      messageText: const Text(
        'Format email tidak sesuai, tolong periksa kembali',
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }

  static SnackbarController tooManyRequest() {
    return Get.snackbar(
      '',
      '',
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
      icon: const Icon(
        Ionicons.warning,
        color: Colors.white,
      ),
      backgroundColor: Colors.red,
      colorText: Colors.white,
      titleText: const Text(
        'Error',
        style: TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      ),
      messageText: const Text(
        'Anda telah mencoba berulang kali dan gagal, harap coba lagi di lain waktu',
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }

  static SnackbarController invalidPassword() {
    return Get.snackbar(
      '',
      '',
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
      icon: const Icon(
        Ionicons.warning,
        color: Colors.white,
      ),
      backgroundColor: Colors.red,
      colorText: Colors.white,
      titleText: const Text(
        'Error',
        style: TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      ),
      messageText: const Text(
        'Password harus lebih dari 6 karakter',
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }

  static SnackbarController invalidCredential() {
    return Get.snackbar(
      '',
      '',
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
      icon: const Icon(
        Ionicons.warning,
        color: Colors.white,
      ),
      backgroundColor: Colors.red,
      colorText: Colors.white,
      titleText: const Text(
        'Error',
        style: TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      ),
      messageText: const Text(
        'Periksa kembali email atau password anda',
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
