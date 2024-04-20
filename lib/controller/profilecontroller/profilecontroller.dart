import 'package:get/get.dart';
import 'package:ktaapp/constants/secrets.dart';
import 'package:ktaapp/services/supabaseservice.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  RxString email = ''.obs;
  RxString noTelp = ''.obs;
  RxString nama = ''.obs;
  RxString status = ''.obs;
  RxString role = ''.obs;
  RxBool isLoading = true.obs;

  Future<void> getUserData() async {
    try {
      final userData = await SupBase.supabase
          .from('user_data')
          .select('email, notelp, role')
          .eq('user_id', SupBase.supabase.auth.currentUser!.id)
          .single();
      email.value = userData['email'];
      noTelp.value = userData['notelp'];
      role.value = userData['role'];
      // print(email.value);

      final statusName = await SupBase.supabase
          .from('data_anggota')
          .select('fullname, status')
          .eq('user_id', SupBase.supabase.auth.currentUser!.id);
      if (statusName.isNotEmpty) {
        statusName.map((e) {
          status.value = e['status'];
          nama.value = e['fullname'];
        });
      } else {}
    } catch (e) {
      throw '$e';
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }
}
