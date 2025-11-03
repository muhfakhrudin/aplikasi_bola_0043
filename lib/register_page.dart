import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaCtr = TextEditingController();
  final _alamatCtr = TextEditingController();
  final _noHpCtr = TextEditingController();
  final _emailCtr = TextEditingController();
  final _passwordCtr = TextEditingController();

  String? _jenisKelamin;
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              // Anda belum menggunakan _formKey, tapi ini praktik yang baik
              // key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                // 👇 1. TAMBAHKAN INI UNTUK RATA KIRI
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    'Selamat Datang Fakhrudin',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Silahkan daftar unutuk melanjutkan ke aplikasi Persibo Bola Mania',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: _namaCtr,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(hintText: "Nama Lengkap"),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _alamatCtr,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(hintText: "Alamat"),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _noHpCtr,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(hintText: "No. Handphone"),
                  ),
                  SizedBox(height: 15),
                  const Text(
                    'Jenis Kelamin',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Laki-laki'),
                          value: 'Laki-laki',
                          groupValue: _jenisKelamin,
                          onChanged: (String? value) {
                            setState(() {
                              _jenisKelamin = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Perempuan'),
                          value: 'Perempuan',
                          groupValue: _jenisKelamin,
                          onChanged: (String? value) {
                            setState(() {
                              _jenisKelamin = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _emailCtr,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(fontSize: 15),
                    decoration: const InputDecoration(hintText: "Email"),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || !value.contains('@')) {
                        return 'Alamat email harus mengandung "@"';
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
