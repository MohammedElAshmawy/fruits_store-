import 'dart:developer';

import 'package:dartz/dartz.dart';
import '../../../features/checkout/data/models/order_model.dart';
import '../../../features/checkout/domain/entities/order_input_entity.dart';
import '../../errors/failures.dart';
import '../../services/database_service.dart';
import 'orders_repo.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService dataBaseService;

  OrdersRepoImpl({required this.dataBaseService});

  @override
  Future<Either<Failure, void>> addOrder({required OrderInputEntity entity}) async {
    try {
      var orderModel = OrderModel.fromEntity(entity);
      await dataBaseService.addData(
        path: "Orders",
        documentId: orderModel.orderId,
        data: orderModel.toJson(),
      );
      return const Right(null);
    } catch (e, stackTrace) {
      log(
        'Error adding order: ${e.toString()}',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
