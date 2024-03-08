import 'package:chstore/models/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AutheService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // create user
  Future<UserModel?> createUser(String email, String password, String name,
      String sdt, String address) async {
    try {
      final UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim());
      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        UserModel newUser = UserModel(
            idUser: firebaseUser.uid,
            email: email,
            name: name,
            sdt: sdt,
            address: address);
        await firebaseFirestore.collection('users').doc(newUser.idUser).set({
          'email': newUser.email,
          'name': newUser.name,
          'sdt': newUser.sdt,
          'address': newUser.address,
        });
        return newUser;
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
    return null;
  }

  // sign in
  Future<UserModel?> signInUser(String email, String password) async {
    try {
      final UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        final userData = await FirebaseFirestore.instance
            .collection('users')
            .doc(firebaseUser.uid)
            .get();
        if (userData.exists) {
          return UserModel(
            idUser: firebaseUser.uid,
            email: firebaseUser.email ?? '',
            name: userData.data()!['name'],
            sdt: userData.data()!['sdt'],
            address: userData.data()!['address'],
          );
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email');
        return null; // Email không tồn tại
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return null; // Sai mật khẩu
      }
      throw e;
    }
    return null; // Trường hợp khác, không xác định
  }

  // sign out
  Future<void> signOutUser() async {
    final User? firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseAuth.instance.signOut();
    }
  }
}
