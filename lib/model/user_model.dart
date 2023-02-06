class UserModel {
  String name;
  String email;
  String phoneNumber;
  String uid;
  String createdAt;

  UserModel(
      {required this.name,
      required this.email,
      required this.phoneNumber,
      required this.uid,
      required this.createdAt});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        name: map['name'] ?? '',
        email: map['email'] ?? '',
        phoneNumber: map['phoneNumber'] ?? '',
        uid: map['uid'] ?? '',
        createdAt: map['createdAt'] ?? '');
  }

  // to map
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "uid": uid,
      "phoneNumber": phoneNumber,
      "createdAt": createdAt
    };
  }
}
