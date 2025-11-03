import 'package:aplikasi_bola/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      // appBar: AppBar(backgroundColor: Colors.white, elevation: 0), // <-- BARIS INI DIHAPUS
      backgroundColor: Colors.white,
      body: SafeArea(
        // Ganti Center ke SingleChildScrollView agar tidak overflow saat keyboard muncul
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              // 1. Hubungkan _formKey ke Form
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start, // Dihapus agar Center berfungsi
                children: [
                  // --- DIBUNGKUS CENTER ---
                  Center(
                    child: Text(
                      'Selamat Datang Fakhrudin',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  // --- DIBUNGKUS CENTER & TAMBAH TEXTALIGN ---
                  Center(
                    child: Text(
                      'Silahkan daftar unutuk melanjutkan ke aplikasi Persibo Bola Mania',
                      textAlign: TextAlign.center, // Tambahkan ini
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),

                  // --- WIDGET FORM KEMBALI KE RATA KIRI ---
                  // Kita buat Column baru agar form tetap rata kiri
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _namaCtr,
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(hintText: "Nama Lengkap"),
                        // 2. Tambahkan validasi
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: _alamatCtr,
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(hintText: "Alamat"),
                        // 2. Tambahkan validasi
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Alamat tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: _noHpCtr,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 15),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        // 2. Perbaiki validasi
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nomor handphone tidak boleh kosong';
                          }
                          if (value.length < 10) {
                            return 'Minimal 10 digit';
                          }
                          return null;
                        },
                        decoration: InputDecoration(hintText: "No. Handphone"),
                      ),
                      SizedBox(height: 15),
                      const Text(
                        'Jenis Kelamin',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          // Tambahkan bold agar konsisten
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
                              contentPadding: EdgeInsets.zero, // Rapatkan
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
                              contentPadding: EdgeInsets.zero, // Rapatkan
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
                          // Tambahkan cek domain
                          if (!value.endsWith('.com')) {
                            return 'Email harus valid (contoh: user@mail.com)';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordCtr,
                        obscureText: _isObscure,
                        style: const TextStyle(fontSize: 15),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Kata sandi tidak boleh kosong';
                          } else if (value.length < 6) {
                            return 'Minimal 6 karakter';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Password",
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _konfmPasswordCtr,
                        obscureText: _isObscureKonfm,
                        style: const TextStyle(fontSize: 15),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        // 2. Perbaiki validasi
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Konfirmasi kata sandi tidak boleh kosong';
                          }
                          if (value != _passwordCtr.text) {
                            return 'Konfirmasi kata sandi tidak sesuai';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Konfirmasi Password",
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscureKonfm
                                  ? Icons.visibility
                                  : Icons.visibility_off,
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

                  // --- AKHIR DARI COLUMN RATA KIRI ---
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 500, // Lebar ini akan otomatis full
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                      ),
                      onPressed: () {
                        // Validasi form
                        bool isValid = _formKey.currentState!.validate();

                        // Validasi jenis kelamin dihapus
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
