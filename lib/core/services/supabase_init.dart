import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseInit {
  static late SupabaseClient _client;

  static Future<void> init() async {
    await Supabase.initialize(
      url: 'https://cfovxpqioxoszbhjiqzl.supabase.co',
      anonKey: 'sb_secret_blVh89riWUXZNK-acJvapw_2d0yW6EW',
    );

    _client = Supabase.instance.client;
  }

  static SupabaseClient get client => _client;
}
