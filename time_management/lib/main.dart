import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'auth/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(
    url: 'https://chdqlrpmatcwniwyhahx.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNoZHFscnBtYXRjd25pd3loYWh4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTY1OTY2NTcsImV4cCI6MjA3MjE3MjY1N30.msMf6RhfR01mPGOkf08c_lhbxBhhAm7y784nvWpxmYU',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginPage(),
    );
  }
}