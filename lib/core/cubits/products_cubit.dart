import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/entities/products_entity.dart';
import 'package:e_commerce/core/repos/products_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());
  final ProductsRepo productsRepo;

  Future<void> getProducts() async {
    emit(ProductsLoadingState());
    var result = await productsRepo.getProducts();
    result.fold(
      (error) {
        debugPrint('❌ ProductsCubit Error: ${error.message}');
        emit(ProductsErrorState(errMessage: error.message));
        },
      (products) => emit(ProductsSuccessState(products: products)),
    );
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoadingState());
    var result = await productsRepo.getBestSelling();
    result.fold(
      (error) => emit(ProductsErrorState(errMessage: error.message)),
      (products) =>
          emit(ProductsSuccessState(products: products)),
    );
  }
}
