import 'package:e_commerce/features/auth/domain/auth_repo.dart';
import 'package:e_commerce/features/auth/domain/user_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepo authRepo;
  static LoginCubit get(context)=>BlocProvider.of(context);

  Future <void> loginWithEmailAndPassword(String email,String password)async{
    emit(LoginLoadingState());
    final result=await authRepo.loginWithEmailAndPassword(email, password);

    result.fold(
        (failure)=>
            emit(LoginErrorState(message: failure.message)),
        (userEntity){
          emit(LoginSuccessState(userEntity: userEntity));
        }
    );
  }

  Future<void> signInWithGoogle()async{
    emit(LoginLoadingState());
    final result=await authRepo.signInWithGoogle();
    result.fold(
            (failure)=>emit(LoginErrorState(message: failure.message)),
            (userEntity)=>emit(LoginSuccessState(userEntity: userEntity))
    );
  }
}