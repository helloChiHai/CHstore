class UserModel {
  final String idUser;
  final String email;
  final String name;
  final String sdt;
  final String address;
  UserModel({
    required this.idUser,
    required this.email,
    required this.name,
    required this.sdt,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'idUser': idUser,
      'email': email,
      'name': name,
      'sdt': sdt,
      'address': address,
    };
  }
}
