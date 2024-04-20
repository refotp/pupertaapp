class Validator {
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName harus diisi';
    }
    return null;
  }

  static String? validatePassword(String? confirmPass, String? pass) {
    // print('a');
    if (confirmPass == null || confirmPass.isEmpty) {
      return 'Harap isi konfirmasi password terlebih dahulu';
    } else if (pass != confirmPass) {
      return 'Periksa kembali password yang anda inputkan';
    } else {
      return null;
    }
  }
}
