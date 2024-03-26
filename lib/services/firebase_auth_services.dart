import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/toast.dart';

class FireBaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  FireBaseAuthService() {
    _auth.setPersistence(Persistence.LOCAL);
  }

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showToast(message: 'Email sudah digunakan');
      } else {
        showToast(message: 'Terjadi kesalahan: ${e.code}');
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
        showToast(message: 'Email dan Password tidak ditemukan');
      } else {
        showToast(message: 'Akun tidak ditemukan');
      }
    }
    return null;
  }
}
