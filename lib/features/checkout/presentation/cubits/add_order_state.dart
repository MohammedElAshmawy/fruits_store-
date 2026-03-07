
sealed class AddOrderState {}

final class AddOrderInitial extends AddOrderState {}
final class AddOrderLoadingState extends AddOrderState {}
final class AddOrderFailureState extends AddOrderState {
  final String errMessage;
  AddOrderFailureState({required this.errMessage});
}
final class AddOrderSuccessState extends AddOrderState {}
