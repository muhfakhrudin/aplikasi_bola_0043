import 'package:aplikasi_bola/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // <-- Pastikan ini di-import

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
  final _konfmPasswordCtr = TextEditingController();

  String? _jenisKelamin;
  bool _isObscure = true;
  bool _isObscureKonfm = true;

  @override
  void dispose() {
    _namaCtr.dispose();
    _alamatCtr.dispose();
    _noHpCtr.dispose();
    _emailCtr.dispose();
    _passwordCtr.dispose();
    _konfmPasswordCtr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Selamat Datang Friends',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Text(
                      'Silahkan daftar unutuk melanjutkan ke aplikasi Persibo Bola Mania',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _namaCtr,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama tidak boleh kosong';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Nama',
                          labelStyle: const TextStyle(fontSize: 16),
                          floatingLabelStyle: const TextStyle(fontSize: 16),
                          hintText: 'Masukkan nama anda',
                          hintStyle: const TextStyle(fontSize: 14),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: _alamatCtr,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Alamat tidak boleh kosong';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Alamat',
                          labelStyle: const TextStyle(fontSize: 16),
                          floatingLabelStyle: const TextStyle(fontSize: 16),
                          hintText: 'Masukkan alamat anda ',
                          hintStyle: const TextStyle(fontSize: 14),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: _noHpCtr,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nomor telepon tidak boleh kosong';
                          }
                          if (value.length < 10) {
                            return 'Nomor telepon minimal 10 digit';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'No. Telepon',
                          labelStyle: const TextStyle(fontSize: 16),
                          floatingLabelStyle: const TextStyle(fontSize: 16),
                          hintText: 'Masukan no. telepon anda',
                          hintStyle: const TextStyle(fontSize: 14),
                        ),
                      ),
                      SizedBox(height: 15),
                      const Text(
                        'Jenis Kelamin',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile<String>(
                              title: const Text('Laki-laki'),
                              value: 'Laki-laki',
                              groupValue: _jenisKelamin,
                              contentPadding: EdgeInsets.zero,
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
                              contentPadding: EdgeInsets.zero,
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email tidak boleh kosong';
                          }
                          final emailRegex = RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          );
                          if (!emailRegex.hasMatch(value)) {
                            return 'Format email tidak valid';
                          }
                          // --- PERBAIKAN 1: Validasi @gmail.com ---
                          if (!value.endsWith('@gmail.com')) {
                            return 'Email harus berakhiran @gmail.com';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                          floatingLabelStyle: TextStyle(
                            fontSize: 16,

                            fontWeight: FontWeight.w500,
                          ),
                          hintText: 'Masukkan email Anda',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordCtr,
                        obscureText: _isObscure,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password tidak boleh kosong';
                          }
                          if (value.length < 6) {
                            return 'Password minimal 6 karakter';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                          floatingLabelStyle: const TextStyle(
                            fontSize: 16,

                            fontWeight: FontWeight.w500,
                          ),
                          hintText: 'Masukkan password Anda',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _konfmPasswordCtr,
                        obscureText: _isObscureKonfm,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Konfirmasi password tidak boleh kosong';
                          }
                          if (value != _passwordCtr.text) {
                            return 'Password tidak cocok';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          // --- PERBAIKAN 2: Fix typo ---
                          labelText: 'Konfirmasi Password',
                          labelStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                          floatingLabelStyle: const TextStyle(
                            fontSize: 16,

                            fontWeight: FontWeight.w500,
                          ),
                          hintText: 'Konfirmasi password Anda',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscureKonfm
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscureKonfm = !_isObscureKonfm;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 500,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                      ),
                      onPressed: () {
                        bool isValid = _formKey.currentState!.validate();

                        if (isValid) {
                          Navigator.pop(context);
                        }
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Apakah sudah punya akun? ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Masuk disini",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ),
                    ],
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
