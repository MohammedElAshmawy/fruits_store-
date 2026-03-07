import 'package:e_commerce/core/repos/orders_repo/orders_repo.dart';
import 'package:e_commerce/core/repos/orders_repo/orders_repo_impl.dart';
import 'package:e_commerce/core/repos/products_repo/products_repo.dart';
import 'package:e_commerce/core/repos/products_repo/products_repo_impl.dart';
import 'package:e_commerce/core/services/database_service.dart';
import 'package:e_commerce/core/services/firebase_auth_service.dart';
import 'package:e_commerce/core/services/supabase_auth_service.dart';
import 'package:e_commerce/core/services/supabase_store_service.dart';
import 'package:e_commerce/features/auth/data/auth_repo_impl.dart';
import 'package:e_commerce/features/auth/data/auth_repo_impl_supabase.dart';
import 'package:e_commerce/features/auth/domain/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<SupabaseAuthService>(SupabaseAuthService());
  
  getIt.registerSingleton<DatabaseService>(SupabaseStoreService());


  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>()
  ));
  
  getIt.registerSingleton<ProductsRepo>(ProductsRepoImpl(
      databaseService: getIt<DatabaseService>()));

  getIt.registerSingleton<AuthRepoSupabase>(AuthRepoImplSupabase(
      supabaseAuthService: getIt<SupabaseAuthService>()));


  getIt.registerSingleton<OrdersRepo>(
      OrdersRepoImpl(
          databaseService: getIt<DatabaseService>()));

}