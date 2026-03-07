import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';

import '../../../features/checkout/domain/entities/order_input_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failure,void>> addOrder({required OrderInputEntity entity});

}