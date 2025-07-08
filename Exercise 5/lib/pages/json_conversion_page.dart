import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/scheduler.dart'; // Tambahkan ini jika Anda memanggil onResult di initState

class JsonConversionPage extends StatefulWidget { // Pastikan nama kelas ini adalah JsonConversionPage
  final Function(Map<String, dynamic>) onResult;

  const JsonConversionPage({super.key, required this.onResult});

  @override
  State<JsonConversionPage> createState() => _JsonConversionPageState(); // Pastikan state juga benar
}

class _JsonConversionPageState extends State<JsonConversionPage> { // Pastikan nama state ini adalah _JsonConversionPageState
  Map<String, dynamic> myDartObject = {
    'nama': 'Budi',
    'umur': 25,
    'adalah_pelajar': true,
    'hobi': ['membaca', 'berenang', 'bermain game'],
    'alamat': {
      'jalan': 'Jl. Contoh No. 10',
      'kota': 'Jakarta',
      'kode_pos': '12345',
    },
  };

  String jsonString = '';
  Map<String, dynamic> decodedObject = {};

  // Jika Anda memanggil onResult di initState untuk JsonConversionPage,
  // Pastikan ada SchedulerBinding.instance.addPostFrameCallback di sini.
  // Jika tidak, Anda bisa abaikan bagian initState ini.
  // Contoh:
  /*
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      // Panggil fungsi yang mengirim hasil awal jika diperlukan
      // Misalnya: _sendInitialResult();
    });
  }
  */

  void _convertObjectToJson() {
    setState(() {
      jsonString = jsonEncode(myDartObject);
    });
    if (mounted) {
      widget.onResult({
        'Panjang String JSON': jsonString.length,
        'Tipe Konversi': 'Objek ke JSON',
        'JSON String': jsonString,
      });
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Objek Dart berhasil dikonversi ke JSON!')),
    );
  }

  void _convertJsonToObject() {
    try {
      setState(() {
        decodedObject = jsonDecode(jsonString);
      });
      if (mounted) {
        widget.onResult({
          'Jumlah Kunci Objek Dekode': decodedObject.keys.length,
          'Tipe Konversi': 'JSON ke Objek',
          'Objek Dekode': decodedObject,
        });
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('String JSON berhasil dikonversi ke Objek Dart!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal mendekode JSON: $e')),
      );
      if (mounted) {
        widget.onResult({
          'Error': 'Gagal mendekode JSON: $e',
          'Tipe Konversi': 'JSON ke Objek',
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konversi JSON'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Objek Dart Asli:',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blueGrey.shade200),
              ),
              child: Text(myDartObject.toString(), style: const TextStyle(fontFamily: 'monospace', fontSize: 14)),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton.icon(
              onPressed: _convertObjectToJson,
              icon: const Icon(Icons.arrow_downward),
              label: const Text('Konversi Objek Dart ke JSON'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              'String JSON:',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              constraints: const BoxConstraints(minHeight: 80),
              child: SelectableText(
                jsonString.isEmpty ? 'Belum dikonversi' : jsonString,
                style: const TextStyle(fontFamily: 'monospace', fontSize: 14),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton.icon(
              onPressed: jsonString.isNotEmpty ? _convertJsonToObject : null,
              icon: const Icon(Icons.arrow_upward),
              label: const Text('Konversi String JSON ke Objek Dart'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Objek Dart Hasil Dekode:',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blueGrey.shade200),
              ),
              constraints: const BoxConstraints(minHeight: 80),
              child: Text(
                decodedObject.isEmpty ? 'Belum didekode' : decodedObject.toString(),
                style: const TextStyle(fontFamily: 'monospace', fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}