import 'package:flutter/material.dart';
import 'package:aplikasi_bola/detail_player.dart';
import 'package:flutter/services.dart';

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

  String? _jenisKelamin;

  @override
  void dispose() {
    _namaCtr.dispose();
    _posisiCtr.dispose();
    _noPunggungCtr.dispose();
    _kewarCtr.dispose();
    _usiaCtr.dispose();
    _tinggiCtr.dispose();
    super.dispose();
  }

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
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(18.00),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 2),
                const Text(
                  'Form menambahkan pemain baru akan ditempatkan disini',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _namaCtr,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama pemain tidak boleh kosong';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Nama Pemain',
                    labelStyle: const TextStyle(fontSize: 16),
                    floatingLabelStyle: const TextStyle(fontSize: 16),
                    hintText: 'Masukkan nama pemain',
                    hintStyle: const TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _posisiCtr,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Posisi pemain tidak boleh kosong';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Posisi Pemain',
                    labelStyle: const TextStyle(fontSize: 16),
                    floatingLabelStyle: const TextStyle(fontSize: 16),
                    hintText: 'Masukkan posisi pemain',
                    hintStyle: const TextStyle(fontSize: 14),
                  ),
                ),

                const SizedBox(height: 10),
                TextFormField(
                  controller: _noPunggungCtr,

                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nomor punggung tidak boleh kosong';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Nomor Punggung Pemain',
                    labelStyle: const TextStyle(fontSize: 16),
                    floatingLabelStyle: const TextStyle(fontSize: 16),
                    hintText: 'Masukkan nomor punggung pemain',
                    hintStyle: const TextStyle(fontSize: 14),
                  ),
                ),

                const SizedBox(height: 10),
                TextFormField(
                  controller: _kewarCtr,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kewarganegaraan tidak boleh kosong';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Kewarganegaraan',
                    labelStyle: const TextStyle(fontSize: 16),
                    floatingLabelStyle: const TextStyle(fontSize: 16),
                    hintText: 'Masukkan kewarganegaraan',
                    hintStyle: const TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _usiaCtr,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      // --- PERBAIKAN: Ganti bahasa ---
                      return 'Usia pemain tidak boleh kosong';
                    }
                    int? usia = int.tryParse(value);
                    if (usia == null || usia < 10 || usia > 50) {
                      return 'Usia harus antara 10-50 tahun';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Usia Pemain',
                    labelStyle: const TextStyle(fontSize: 16),
                    floatingLabelStyle: const TextStyle(fontSize: 16),
                    hintText: 'Masukkan usia pemain',
                    hintStyle: const TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _tinggiCtr,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tinggi pemain tidak boleh kosong';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Tinggi Pemain (cm)',
                    labelStyle: const TextStyle(fontSize: 16),
                    floatingLabelStyle: const TextStyle(fontSize: 16),
                    hintText: 'Masukkan tinggi pemain',
                    hintStyle: const TextStyle(fontSize: 14),
                  ),
                ),

                const SizedBox(height: 15),
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
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      final bool isFormValid = _formKey.currentState!
                          .validate();

                      if (isFormValid) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPlayerPage(
                              nama: _namaCtr.text,
                              posisi: _posisiCtr.text,
                              nomorPunggung: _noPunggungCtr.text,
                              kewarganegaraan: _kewarCtr.text,
                              usia: _usiaCtr.text,
                              tinggi: _tinggiCtr.text,
                              jenisKelamin: _jenisKelamin ?? 'Tidak diisi',
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: const Text(
                      'Tambah Pemain',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
