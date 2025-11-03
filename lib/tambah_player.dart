import 'package:flutter/material.dart';

class TambahPlayerPage extends StatefulWidget {
  const TambahPlayerPage({super.key});

  @override
  State<TambahPlayerPage> createState() => _TambahPlayerPageState();
}

class _TambahPlayerPageState extends State<TambahPlayerPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaCtr = TextEditingController();
  final _usiaCtr = TextEditingController();
  final _noPunggungCtr = TextEditingController();
  final _posisiCtr = TextEditingController();
  final _kewarCtr = TextEditingController();
  final _tinggiCtr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Tambah Player Baru', style: TextStyle(fontSize: 20)),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(18.00),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [const SizedBox(height: 2),
              const Text('Form menambahkan pemain baru akan ditempatkan disini', style: TextStyle(fontSize: 16),
              ),
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}
