import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/entities/products_entity.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/repos/products_repo.dart';
import 'package:e_commerce/core/services/database_service.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl({required this.databaseService});

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var products = await databaseService.getData(path: 'products');
      return Right(products);
    }catch(e){
      return Left(ServerFailure(message: "failed to get products"));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSelling() {
    // TODO: implement getBestSelling
    throw UnimplementedError();
  }
}
