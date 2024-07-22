// ignore_for_file: unrelated_type_equality_checks

import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase/supabase.dart' as sb;

import '../../../core/errors/failures.dart';
import '../../../core/utils/constants.dart';
import '../../models/auth/user_model.dart';
import '../../../domain/entities/auth/login_request_entity.dart';
import '../../../domain/entities/auth/register_request_entity.dart';
import '../../../domain/entities/auth/update_request_entity.dart';
import '../../../core/errors/exceptions.dart';
import '../../../domain/entities/auth/user_entity.dart';

import 'dart:developer';

abstract class AuthRemoteDataSource {
  sb.Session? get getCurrentUserSession;

  Future<String> getUserIDAuth();
  Future<int> getUserID();
  Future<bool> checkLogin();
  Future<void> login(LoginRequestEntity request);
  Future<void> register(RegisterRequestEntity request);
  Future<void> logout();
  Future<void> forgotPassword(String email);
  Future<void> updateUser(UpdateRequestEntity request);
  Future<UserEntity> getRemoteUserData(int userId);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final sb.SupabaseClient supabase;
  final FirebaseAuth auth;

  AuthRemoteDataSourceImpl({
    required this.supabase,
    required this.auth,
  });

  @override
  sb.Session? get getCurrentUserSession => supabase.auth.currentSession;

  @override
  Future<String> getUserIDAuth() async {
    try {
      return supabase.auth.currentUser!.id;
    } catch (e) {
      return _handleException(e);
    }
  }

  @override
  Future<int> getUserID() async {
    try {
      final email = supabase.auth.currentUser?.email;

      final response = await supabase
          .from('users')
          .select('id')
          .eq('email', email!)
          .single();

      final id = response['id'] as int;
      return id;
    } catch (e) {
      return _handleException(e);
    }
  }

  @override
  Future<bool> checkLogin() async {
    try {
      if (getCurrentUserSession != null) {
        return true;
      }
      return false;
    } catch (e) {
      return _handleException(e);
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    try {
      await supabase.auth.resetPasswordForEmail(email);
    } catch (e) {
      return _handleException(e);
    }
  }

  @override
  Future<UserEntity> getRemoteUserData(int userId) async {
    try {
      final res =
          await supabase.from('users').select().eq('id', userId).single();

      return UserModel.fromJson(res);
    } catch (e) {
      return _handleException(e);
    }
  }

  @override
  Future<void> login(LoginRequestEntity request) async {
    try {
      final res = await supabase.auth.signInWithPassword(
        email: request.email,
        password: request.password,
      );
      await supabase.auth.setSession(res.session!.refreshToken!);
    } catch (e) {
      if (e is sb.AuthException) {
        throw sb.AuthException(e.message);
      }
      throw UnknownException();
    }
  }

  @override
  Future<void> logout() async {
    try {
      await supabase.auth.signOut();
    } catch (e, s) {
      log('$e, $s');
      return _handleException(e);
    }
  }

  @override
  Future<void> register(RegisterRequestEntity request) async {
    try {
      //? SUPABASE AUTH
      await supabase.auth.signUp(
        email: request.email,
        password: request.password,
      );

      //? UPLOAD TO SUPABASE TABLE
      await supabase.from('users').insert(request.toJson());
    } catch (e, s) {
      log('$e, $s');
      return _handleException(e);
    }
  }

  @override
  Future<void> updateUser(UpdateRequestEntity request) async {
    try {
      await supabase
          .from('users')
          .update(request.toJson())
          .eq('id', request.id!);
    } catch (e) {
      return _handleException(e);
    }
  }

  _handleException(Object e) {
    if (e is sb.AuthException) {
      throw sb.AuthException(
        e.message == 'Invalid login credentials'
            ? 'Account not found'
            : e.message,
      );
    } else if (e is ServerException) {
      throw ServerFailure(message: e.message);
    } else {
      throw const UnknownFailure(message: FAILURE_UNKNOWN);
    }
  }
}
