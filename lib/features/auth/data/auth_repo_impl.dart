import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/exceptions.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/services/database_service.dart';
import 'package:e_commerce/core/services/firebase_auth_service.dart';
import 'package:e_commerce/core/helper/shared_pref_singletone.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/core/utils/endpoints.dart';
import 'package:e_commerce/features/auth/data/user_model.dart';
import 'package:e_commerce/features/auth/domain/auth_repo.dart';
import 'package:e_commerce/features/auth/domain/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl({
    required this.firebaseAuthService,
    required this.databaseService,
  });

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(name: name, email: email, uId: user.uid);
      await addUserData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      log("Exception in AuthRepoImpl and error is ${e.toString()}");
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthService.loginWithEmailAndPassword(
        email: email,
        password: password,
      );

      var userEntity = await getUserData(uid: user.uid);
      await saveUserData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      log("Exception in AuthRepoImpl and error is ${e.toString()}");
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExist = await databaseService.checkUserExist(
        path: BackendEndpoint.ifUserExist,
        documentId: user.uid,
      );

      if (isUserExist) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return Right(userEntity);
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      return Left(ServerFailure(message: 'حدث خطأ ما برجاء المحاولة مرة اخري'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndpoint.addUserData,
      data: UserModel.fromEntity(user).toMap(),
      documentId: user.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userData = await databaseService.getData(
      path: BackendEndpoint.getUserData,
      documentUid: uid,
    );
    return UserModel.fromJson(userData);
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await Prefs.setString(KUserData, jsonData);
  }
}

