import 'package:supabase_flutter/supabase_flutter.dart';
import 'database_service.dart';

class SupabaseStoreService extends DatabaseService {
  final SupabaseClient client = Supabase.instance.client;

  @override
  Future<List<Map<String, dynamic>>> getData({required String path, String? documentUid,
    Map<String, dynamic>? query,
  }) async {
    PostgrestFilterBuilder? request = client.from(path).select();
    final response = await request;
    return List<Map<String, dynamic>>.from(response);
  }

  @override
  Future<void> addData({required String path, required Map<String, dynamic> data, String? documentId,
  }) async {
    await client.from(path).insert(data);
  }

  @override
  Future<bool> checkUserExist({required String path, required String documentId}) async {
    final response = await client
        .from(path)
        .select()
        .eq('id', documentId)
        .maybeSingle();
    return response != null;
  }
}