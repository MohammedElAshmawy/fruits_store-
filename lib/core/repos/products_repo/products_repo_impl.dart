import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/entities/products_entity.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/repos/products_repo/products_repo.dart';
import 'package:e_commerce/core/services/database_service.dart';
import '../../models/products_model.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl({required this.databaseService});

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data = await databaseService.getData(path: 'products') as List<Map<String, dynamic>>;
      List<ProductEntity> products = data.map((e) => ProductModel.fromJson(e).toEntity())
          .toList();

      print(" the product is ${products}");
      return Right(products);
    } catch (e,s) {
      print("❌ ERROR => $e");
      print("📍 STACK TRACE => $s");
      return Left(ServerFailure(message: "failed to get products"));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSelling() async {
    try {
      var data =
          await databaseService.getData(
                path: 'products',
                query: {
                  'limit': 10,
                  'orderBy': 'sellingCount',
                  'descending': true,
                },
              )
              as List<Map<String, dynamic>>;
      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return Right(products);
    } catch (e) {
      return Left(ServerFailure(message: "failed to get products"));
    }
  }
}
