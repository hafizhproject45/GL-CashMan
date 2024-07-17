// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:gl_cashman/core/utils/env.dart'; // Ensure this exists and contains the Supabase URL and key
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:gl_cashman/data/models/auth/user_model.dart';
// import 'package:gl_cashman/domain/entities/auth/user_entity.dart';

// void main() async {
//   // Ensure proper initialization of Flutter bindings
//   WidgetsFlutterBinding.ensureInitialized();

//   // Initialize Supabase
//   await Supabase.initialize(
//     url: Env.sbUrl, // Your Supabase URL
//     anonKey: Env.sbAnonKey, // Your Supabase anonymous key
//   );

//   Future<UserEntity> getRemoteUserData(int userId) async {
//     final SupabaseClient supabase = Supabase.instance.client;

//     final res = await supabase
//         .from('users')
//         .select()
//         .eq('id', userId)
//         .single(); // Added execute()

//     return UserModel.fromJson(res);
//   }

//   test('get user data by supabase', () async {
//     final user = await getRemoteUserData(2);

//     print('User data: $user');

//     // Perform assertions based on the expected user data
//     expect(user, isNotNull);
//     expect(user.id, 2);
//     expect(user.email, 'hafizh@gmail.com'); // Replace with expected email
//   });
// }
