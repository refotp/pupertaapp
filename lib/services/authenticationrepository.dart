import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ktaapp/constants/secrets.dart';
import 'package:ktaapp/screens/login/loginpage.dart';
import 'package:ktaapp/screens/navigation/navigation.dart';
import 'package:ktaapp/screens/onboarding/onboarding.dart';
import 'package:supabase/supabase.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final _auth = SupBase.supabase.auth;
  User? get authUser => _auth.currentUser;
  final deviceStorage = GetStorage();
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    pindahHalaman();
    super.onReady();
  }

  pindahHalaman() async {
    final user = _auth.currentSession;
    if (user != null) {
      Get.offAll(() => const NavigationPage());
    } else {
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginPage())
          : Get.offAll(() => const OnBoardingPage());
    }
  }

  Future<AuthResponse> googleSignIn() async {
    try {
      const webClientId =
          '223318383763-inpa061rdor0h0jch26spngl2shojfc0.apps.googleusercontent.com';
      final GoogleSignIn googleSignIn = GoogleSignIn(
        serverClientId: webClientId,
      );
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (accessToken == null) {
        throw 'No Access Token found.';
      }
      if (idToken == null) {
        throw 'No ID Token found.';
      }
      return _auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
    } catch (e) {
      throw 'Error : $e';
    }
  }

  Future<AuthResponse> signUp(String email, String pass) async {
    try {
      return await SupBase.supabase.auth.signUp(
        email: email,
        password: pass,
      );
    } catch (e) {
      throw 'Error : $e';
    }
  }

  void logout() async {
    await SupBase.supabase.auth.signOut();
    pindahHalaman();
  }

  Future<AuthResponse> login(String email, String password) async {
    try {
      return await _auth.signInWithPassword(password: password, email: email);
    } catch (e) {
      rethrow;
    }
  }
}
