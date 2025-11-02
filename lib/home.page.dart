import 'package:flutter/material.dart';
//import 'tambah_pemain_page.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  final String email;
  const HomePage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Text(
          'Welcome, $email',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
