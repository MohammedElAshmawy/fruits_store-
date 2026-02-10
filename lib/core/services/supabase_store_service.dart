import 'package:e_commerce/core/services/database_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStoreService  extends DatabaseService{

  final SupabaseClient client = Supabase.instance.client;


  @override
  Future<void> addData({required String path, required Map<String, dynamic> data, String? documentId}) {
    // TODO: implement addData
    throw UnimplementedError();
  }

  @override
  Future<bool> checkUserExist({required String path, required String documentId}) {
    // TODO: implement checkUserExist
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getData({required String path, String? documentUid}) {
    // TODO: implement getData
    throw UnimplementedError();
  }

}