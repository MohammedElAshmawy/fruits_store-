import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/repos/orders_repo/orders_repo.dart';
import 'package:e_commerce/core/services/database_service.dart';
import 'package:e_commerce/features/checkout/data/models/order_model.dart';
import 'package:e_commerce/features/checkout/domain/entities/order_input_entity.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService databaseService;
  OrdersRepoImpl({required this.databaseService});

  @override
  Future<Either<Failure, void>> addOrder(
      {required OrderInputEntity entity}) async {
    try {
      await databaseService.addData(
          path: "Order",
          documentId: entity.uID,
          data: OrderModel.fromEntity(entity: entity).toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}