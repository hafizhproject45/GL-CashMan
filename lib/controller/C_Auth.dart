import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/toast.dart';

class C_Auth {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        dangerToast(message: 'Email sudah digunakan!');
      } else {
        dangerToast(message: 'Terjadi kesalahan: ${e.code}!');
      }
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        dangerToast(message: 'Email dan Password tidak ditemukan!');
      } else {
        dangerToast(message: 'Akun tidak ditemukan!');
      }
    }
    return null;
  }
}
