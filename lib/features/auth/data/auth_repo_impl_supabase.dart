import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/exceptions.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/services/supabase_auth_service.dart';
import 'package:e_commerce/features/auth/domain/auth_repo.dart';
import 'package:e_commerce/features/auth/domain/user_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImplSupabase extends AuthRepoSupabase {
  final SupabaseAuthService supabaseAuthService;

  AuthRepoImplSupabase({required this.supabaseAuthService});

  @override
  Future<Either<Failure, UserEntity>> signupWithSupabase(
    String name,
    String email,
    String password,
  ) async {
    AuthResponse user;
    try {
      user = await supabaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );
      var userEntity = UserEntity(name: name, email: email, uId: user.user!.id);
      if (user.user == null) {
        return Left(ServerFailure(message: 'sign up failed'));
      }
      return Right(userEntity);
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithSupabase(
    String email,
    String password,
  ) async {
    try {
      final response = await supabaseAuthService.signIn(
        email: email,
        password: password,
      );
      final user = response.user;
      var userEntity = UserEntity(name: user!.userMetadata?['name'] ?? '', email: email, uId: user.id,);
      return Right(userEntity);
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
