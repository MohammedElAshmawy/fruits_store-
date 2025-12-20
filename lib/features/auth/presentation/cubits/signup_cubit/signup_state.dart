part of 'signup_cubit.dart';

sealed class SignupStates {}

final class SignupInitial extends SignupStates {}

final class SignupLoading extends SignupStates {}

final class SignupSuccess extends SignupStates {
  final UserEntity userEntity;
  SignupSuccess({required this.userEntity});
}

final class SignupError extends SignupStates {
  final String message;
  SignupError({required this.message});
}