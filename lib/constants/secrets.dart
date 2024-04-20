import 'package:supabase_flutter/supabase_flutter.dart';

class UrlKeys {
  static String urlKeys = 'https://bufbpyhpfsdlxylwvzhn.supabase.co';
  static String supabaseKeys =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1ZmJweWhwZnNkbHh5bHd2emhuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTA3MzM4NjIsImV4cCI6MjAyNjMwOTg2Mn0.vXvVnY4GJ5b1t7cNYUmyr33FMOZObBVvAQgFtQP2toM';
}

class SupBase {
  static final supabase = Supabase.instance.client;
}

class AdminKey {
  static const String pin = '9180';
}
