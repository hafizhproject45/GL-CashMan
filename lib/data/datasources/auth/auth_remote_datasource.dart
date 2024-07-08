import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../presentation/widgets/toast.dart';
import '../../models/user/user_model.dart';
import '../../../core/errors/exceptions.dart';
import '../../../domain/entities/user/user_entity.dart';

abstract class AuthRemoteDataSource {
  Future<bool> checkLogin();
  Future<void> login(UserEntity request);
  Future<void> register(UserEntity request);
  Future<void> logout();
  Future<void> googleAuth();
  Future<void> forgotPassword(String email);
  Future<void> getCreateCurrentUser(UserEntity request);
  Future<void> getUpdateUser(UserEntity request);
  Future<String> getCurrentUID();
  Future<List<UserEntity>> getUserData(UserEntity request);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;

  AuthRemoteDataSourceImpl({
    required this.firestore,
    required this.auth,
    required this.googleSignIn,
  });

  @override
  Future<void> forgotPassword(String email) async {
    await _handleExceptions(() async {
      await auth.sendPasswordResetEmail(email: email);
    });
  }

  @override
  Future<void> getCreateCurrentUser(UserEntity request) async {
    await _handleExceptions(() async {
      final userCollection = firestore.collection('users');
      final uid = await getCurrentUID();

      final userDoc = await userCollection.doc(uid).get();
      if (!userDoc.exists) {
        final newUser = request.toJson();
        await userCollection.doc(uid).set(newUser);
      } else {
        if (kDebugMode) {
          print('User already exists');
        }
      }
    });
  }

  @override
  Future<String> getCurrentUID() async {
    return await _handleExceptions(() async {
      return auth.currentUser!.uid;
    });
  }

  @override
  Future<void> getUpdateUser(UserEntity request) async {
    await _handleExceptions(() async {
      final userCollection = firestore.collection('users');
      final userInformation = request.toUpdateMap();
      await userCollection.doc(request.id).update(userInformation);
    });
  }

  @override
  Future<void> googleAuth() async {
    await _handleExceptions(() async {
      // Start the sign-in process with Google
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        // If the user cancels the sign-in, we return null
        throw AuthException(message: 'Sign in aborted by user');
      }

      // Obtain the Google Sign-In authentication details
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Use the credential to sign in with Firebase
      await auth.signInWithCredential(credential);
    });
  }

  @override
  Future<bool> checkLogin() async {
    return auth.currentUser?.uid != null;
  }

  @override
  Future<void> login(UserEntity request) async {
    await _handleExceptions(() async {
      await auth.signInWithEmailAndPassword(
        email: request.email!,
        password: request.password!,
      );
    });
  }

  @override
  Future<void> logout() async {
    await _handleExceptions(() async {
      await auth.signOut();
    });
  }

  @override
  Future<void> register(UserEntity request) async {
    await _handleExceptions(() async {
      await auth.createUserWithEmailAndPassword(
        email: request.email!,
        password: request.password!,
      );
      await getCreateCurrentUser(request);
    });
  }

  @override
  Future<List<UserEntity>> getUserData(UserEntity request) async {
    try {
      final userCollection = firestore.collection('users');
      final querySnapshot = await userCollection
          .limit(1)
          .where('id', isEqualTo: request.id)
          .get();

      return querySnapshot.docs.map((doc) => UserModel.fromJson(doc)).toList();
    } catch (e) {
      if (e is FirebaseAuthException) {
        throw AuthException(message: e.message);
      } else if (e is AuthException || e is ServerException) {
        rethrow;
      } else {
        throw UnknownException();
      }
    }
  }

  Future<T> _handleExceptions<T>(Future<T> Function() action) async {
    try {
      return await action();
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          dangerToast(message: 'Email sudah digunakan!');
        } else {
          dangerToast(message: 'Terjadi kesalahan: ${e.code}!');
        }

        if (e.code == 'user-not-found') {
          dangerToast(message: 'Email tidak ditemukan!');
        } else if (e.code == 'wrong-password') {
          dangerToast(message: 'Password salah!');
        } else {
          dangerToast(message: 'Terjadi kesalahan: ${e.code}!');
        }

        throw AuthException(message: e.message);
      } else if (e is AuthException || e is ServerException) {
        rethrow;
      } else {
        throw UnknownException();
      }
    }
  }
}

extension on UserEntity {
  Map<String, dynamic> toUpdateMap() {
    final map = <String, dynamic>{};
    if (fullname != null && fullname!.isNotEmpty) map['fullname'] = fullname;
    if (block != null && block!.isNotEmpty) map['block'] = block;
    if (contact != null && contact!.isNotEmpty) map['contact'] = contact;
    if (email != null && email!.isNotEmpty) map['email'] = email;
    return map;
  }
}
