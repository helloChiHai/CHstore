import 'package:chstore/models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AutheService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // create user
  Future<UserModel?> createUser(String email, String password, String name,
      String sdt, String address) async {
    try {
      final UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim());
      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        return UserModel(
            idUser: firebaseUser.uid,
            email: email,
            password: password,
            name: name,
            sdt: sdt,
            address: address);
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
    return null;
  }

  // sign out
  Future<void> signOutUser() async {
    final User? firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseAuth.instance.signOut();
    }
  }
}
