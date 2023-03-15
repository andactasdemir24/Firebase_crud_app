import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firenase_crud2/models/users_model.dart';

class UsersController {
  final CollectionReference _users = FirebaseFirestore.instance.collection('users');

  Future addUsers(UserModel user) async {
    await _users.doc().set(user.addData());
  }

  Future updateUsers(UserModel user) async {
    await _users.doc(user.id).update(user.addData());
  }

  Future deleteUsers(UserModel user) async {
    await _users.doc(user.id).delete();
  }
}
