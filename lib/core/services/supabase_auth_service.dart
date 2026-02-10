import 'dart:developer';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../errors/exceptions.dart';

class SupabaseAuthService {
  final SupabaseClient client = Supabase.instance.client;

  Future<AuthResponse> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await client.auth.signUp(
        data: {'name': name},
        email: email,
        password: password,
      );
      return response;
    } on AuthApiException catch (e) {
      log('Supabase Auth Error => code: ${e.code}, message: ${e.message}');
      if (e.code == 'user_already_exists' || e.code == 'email_exists') {
        throw CustomException(message: 'email is already taken');
      } else if (e.message.toLowerCase().contains('password')) {
        throw CustomException(message: 'password is too weak');
      } else if (e.message.toLowerCase().contains('email')) {
        throw CustomException(message: 'email address invalid');
      } else {
        throw CustomException(message: e.message);
      }
    }
  }

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return response;
    } on AuthApiException catch (e) {
      final message = e.message.toLowerCase();
      final statusCode=int.tryParse(e.statusCode??'');

      if (e.code == 'invalid_login_credentials') {
        throw CustomException(message: 'email or password is incorrect');
      } else if (e.code == 'email_not_confirmed') {
        throw CustomException(message: 'please confirm your email first');
      } else if (message.contains('password')) {
        throw CustomException(message: 'password is incorrect');
      } else if (message.contains('email')) {
        throw CustomException(message: 'email address is invalid');
      } else if (statusCode == 429) {
        throw CustomException(message: 'too many attempts, try again later');
      } else if (e.statusCode != null && (statusCode == 500||statusCode==501)) {
        throw CustomException(message: 'server error, please try again later');
      } else {
        throw CustomException(message: e.message);
      }
    } catch (e) {
      throw CustomException(
        message: 'something went wrong, please try again later',
      );
    }
  }
}

