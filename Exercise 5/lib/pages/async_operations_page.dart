import 'package:flutter/material.dart';

class AsyncOperationsPage extends StatefulWidget {
  final Function(String) onResult;

  const AsyncOperationsPage({super.key, required this.onResult});

  @override
  State<AsyncOperationsPage> createState() => _AsyncOperationsPageState();
}

class _AsyncOperationsPageState extends State<AsyncOperationsPage> {
  String _message = 'Tekan tombol untuk memulai operasi asinkron';
  bool _isLoading = false;

  Future<String> _fetchData() async {
    setState(() {
      _isLoading = true;
      _message = 'Mengambil data... Mohon tunggu 3 detik.';
    });
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      _isLoading = false;
    });
    final result = 'Data berhasil diambil setelah 3 detik!';
    widget.onResult(result);
    return result;
  }

  Future<void> _processData() async {
    setState(() {
      _isLoading = true;
      _message = 'Memproses data... Mohon tunggu 2 detik.';
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pemrosesan data selesai!')),
    );
    final result = 'Data diproses dan notifikasi ditampilkan.';
    setState(() {
      _message = result;
    });
    widget.onResult(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Operasi Asinkron'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (_isLoading)
                const Column(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 20.0),
                  ],
                ),
              Text(
                _message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.indigo),
              ),
              const SizedBox(height: 40.0),
              ElevatedButton.icon(
                onPressed: _isLoading
                    ? null
                    : () async {
                  String result = await _fetchData();
                  setState(() {
                    _message = result;
                  });
                },
                icon: const Icon(Icons.download),
                label: const Text('Ambil Data (Async/Await)'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  textStyle: const TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(height: 15.0),
              ElevatedButton.icon(
                onPressed: _isLoading
                    ? null
                    : () {
                  _processData();
                },
                icon: const Icon(Icons.build),
                label: const Text('Proses Data (Jalankan Tanpa Menunggu)'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  textStyle: const TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}