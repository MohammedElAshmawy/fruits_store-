import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/repos/orders_repo/orders_repo.dart';
import '../../domain/entities/order_input_entity.dart';
import 'add_order_state.dart';


class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.ordersRepo) : super(AddOrderInitial());


  final OrdersRepo ordersRepo;

  void addOrder({required OrderInputEntity entity}) async {
    emit(AddOrderLoadingState());
    var result = await ordersRepo.addOrder(entity: entity);

    result.fold((failure) {
      emit(AddOrderFailureState(errMessage: failure.message));
    }, (success) {
      emit(AddOrderSuccessState());
    });
  }
}










