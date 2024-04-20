import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ktaapp/constants/secrets.dart';
import 'package:ktaapp/myapp.dart';
import 'package:ktaapp/services/authenticationrepository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Supabase.initialize(url: UrlKeys.urlKeys, anonKey: UrlKeys.supabaseKeys)
      .then((value) => Get.put(AuthenticationRepository()));
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}
