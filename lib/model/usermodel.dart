import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  static UserModel empty() =>
      UserModel(id: '', name: '', email: '', phoneNumber: '');
  Map<String, dynamic> toJson() {
    return {
      'NamaLengkap': name,
      'Email': email,
      'NomorTelfon': phoneNumber,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    if (documentSnapshot.data() != null) {
      final data = documentSnapshot.data()!;
      return UserModel(
        id: documentSnapshot.id,
        name: data['NamaLengkap'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['NomorTelfon'] ?? '',
      );
    }
    return UserModel.empty();
  }
}
