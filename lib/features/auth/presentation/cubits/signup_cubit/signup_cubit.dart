import 'package:e_commerce/features/auth/domain/auth_repo.dart';
import 'package:e_commerce/features/auth/domain/user_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupStates> {
  SignupCubit(this.authRepo) : super(SignupInitial());

  static SignupCubit get(context)=> BlocProvider.of(context);


  final AuthRepo authRepo;

  Future <void> createUserWithEmailAndPassword(String name,String email,String password) async{
    emit(SignupLoading());
    final result=await authRepo.createUserWithEmailAndPassword(name, email, password);
    result.fold(
        (failure)=>
            emit(SignupError(message: failure.message)),
        (userEntity)=>
            emit(SignupSuccess(userEntity: userEntity))

    );
  }
}
