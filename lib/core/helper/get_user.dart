import 'dart:convert';
import 'package:e_commerce/core/helper/shared_pref_singletone.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/features/auth/data/user_model.dart';
import 'package:e_commerce/features/auth/domain/user_entity.dart';

UserEntity getUser(){

  var jsonString=Prefs.getString(KUserData);
  var userEntity=UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}