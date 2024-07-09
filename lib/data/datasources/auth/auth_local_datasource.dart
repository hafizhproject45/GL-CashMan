import 'package:hive_flutter/hive_flutter.dart';

import '../../../core/errors/exceptions.dart';
import '../../../core/utils/constants.dart';
import '../../models/auth/login_local_model.dart';

abstract class AuthLocalDatasource {
  /// Check login
  Future<bool> checkLogin();

  /// For fetch login data
  Future<LoginLocalModel> getLoginData();

  /// For saving user id
  Future<void> saveLoginData(LoginLocalModel request);

  /// For logout
  Future<bool> deleteLoginData();
}

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  @override
  Future<bool> checkLogin() async {
    try {
      Box cacheBox = await getCacheBox();

      if (cacheBox.containsKey(LOGIN_DATA_ID)) {
        return true;
      } else {
        throw CacheException();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LoginLocalModel> getLoginData() async {
    Box cacheBox = await getCacheBox();

    if (cacheBox.containsKey(LOGIN_DATA_ID)) {
      return cacheBox.get(LOGIN_DATA_ID);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> saveLoginData(LoginLocalModel request) async {
    Box cacheBox = await getCacheBox();

    cacheBox.put(LOGIN_DATA_ID, request).onError((error, stackTrace) {
      throw CacheException();
    });
  }

  @override
  Future<bool> deleteLoginData() async {
    Box cacheBox = await getCacheBox();

    return cacheBox
        .delete(LOGIN_DATA_ID)
        .then((value) => true)
        .onError((error, stackTrace) => throw CacheException());
  }

  Future<Box> getCacheBox() async {
    return await Hive.openBox(LOGIN_DATA_BOX);
  }
}
