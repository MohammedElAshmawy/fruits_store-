import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/features/auth/domain/user_entity.dart';

abstract class AuthRepo {

  Future<Either<Failure,UserEntity>> createUserWithEmailAndPassword(String name,String email,String password);

  Future <Either<Failure,UserEntity>> loginWithEmailAndPassword(String email,String password);

  Future<Either<Failure,UserEntity>> signInWithGoogle();

  Future addUserData({required UserEntity user});

  Future saveUserData({required UserEntity user});

  Future <UserEntity> getUserData({required String uid});

}