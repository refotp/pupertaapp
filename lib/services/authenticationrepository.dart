import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ktaapp/screens/login/loginpage.dart';
import 'package:ktaapp/screens/navigation/navigation.dart';
import 'package:ktaapp/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  User? get authUser => _auth.currentUser;

  final deviceStorage = GetStorage();
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    pindahHalaman();
    super.onReady();
  }

  pindahHalaman() async {
    final user = _auth.currentUser;
    if (user != null) {
      Get.offAll(() => const NavigationPage());
    } else {
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginPage())
          : Get.offAll(() => const OnBoardingPage());
    }
  }

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw 'something went wrong';
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => const LoginPage());
  }

  Future<UserCredential> logIn(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }
}
