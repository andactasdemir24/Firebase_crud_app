class UserModel {
  final id;
  final String? username;
  final int? age;

  UserModel({
    this.username,
    this.age,
    this.id,
  });

  Map<String, dynamic> addData() {
    return {
      'username': username,
      'age': age,
    };
  }
}
