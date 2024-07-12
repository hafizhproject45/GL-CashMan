import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../../../domain/entities/auth/login_request_entity.dart';
import '../../../domain/entities/auth/register_request_entity.dart';
import '../../../domain/entities/auth/update_request_entity.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../models/auth/user_model.dart';
import '../../../core/errors/exceptions.dart';
import '../../../domain/entities/auth/user_entity.dart';

abstract class AuthRemoteDataSource {
  Future<void> login(LoginRequestEntity request);
  Future<void> register(RegisterRequestEntity request);
  Future<void> logout();
  Future<void> googleAuth();
  Future<void> forgotPassword(String email);
  Future<void> getCreateCurrentUser(RegisterRequestEntity request);
  Future<void> getUpdateUser(UpdateRequestEntity request);
  Future<String> getCurrentUID();
  Future<List<UserEntity>> getRemoteUserData(String params);
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
  Future<void> getCreateCurrentUser(RegisterRequestEntity request) async {
    await _handleExceptions(() async {
      final userCollection = firestore.collection('users');

      final userDoc = await userCollection.doc(request.email).get();
      if (!userDoc.exists) {
        final newUser = request.toJson();
        await userCollection.doc(request.email).set(newUser);
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
  Future<void> getUpdateUser(UpdateRequestEntity request) async {
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
  Future<void> login(LoginRequestEntity request) async {
    await _handleExceptions(() async {
      await auth.signInWithEmailAndPassword(
        email: request.email,
        password: request.password,
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
  Future<void> register(RegisterRequestEntity request) async {
    await _handleExceptions(() async {
      await auth.createUserWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );
      await getCreateCurrentUser(request);
    });
  }

  @override
  Future<List<UserEntity>> getRemoteUserData(String params) async {
    try {
      final userCollection = firestore.collection('users');
      final querySnapshot =
          await userCollection.limit(1).where('id', isEqualTo: params).get();

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
          throw AuthException(message: 'Email already use!');
        } else if (e.code == 'invalid-credential' ||
            e.code == 'user-not-found') {
          throw AuthException(message: 'User not found!');
        } else if (e.code == 'wrong-password') {
          throw AuthException(message: 'Wrong password!');
        } else {
          throw AuthException(message: '${e.message}!');
        }
      } else if (e is AuthException || e is ServerException) {
        rethrow;
      } else {
        throw UnknownException();
      }
    }
  }
}

extension on UpdateRequestEntity {
  Map<String, dynamic> toUpdateMap() {
    final map = <String, dynamic>{};
    map['fullname'] = fullname;
    map['block'] = block;
    map['contact'] = contact;
    map['email'] = email;
    map['updated_at'] = updatedAt;
    return map;
  }
}
