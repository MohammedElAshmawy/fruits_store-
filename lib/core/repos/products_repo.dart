import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/entities/products_entity.dart';
import 'package:e_commerce/core/errors/failures.dart';

abstract class ProductsRepo {

  Future<Either<Failure,List<ProductEntity>>> getProducts();
  Future<Either<Failure,List<ProductEntity>>> getBestSelling();

}