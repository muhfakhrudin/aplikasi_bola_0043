import 'package:flutter/material.dart';


class TambahPlayerPage extends StatefulWidget {
  const TambahPlayerPage({super.key});

  @override
  State<TambahPlayerPage> createState() => _TambahPlayerPageState();
}

class _TambahPlayerPageState extends State<TambahPlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Tambah Player Baru', style: TextStyle(fontSize: 20)),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}
