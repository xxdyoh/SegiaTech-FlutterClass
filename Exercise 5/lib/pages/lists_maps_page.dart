import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart'; // Import ini untuk SchedulerBinding

class ListsMapsPage extends StatefulWidget {
  final Function(Map<String, dynamic>) onResult;

  const ListsMapsPage({super.key, required this.onResult});

  @override
  State<ListsMapsPage> createState() => _ListsMapsPageState();
}

class _ListsMapsPageState extends State<ListsMapsPage> {
  List<String> fruits = ['Apel', 'Pisang', 'Jeruk', 'Nanas'];
  Map<String, String> fruitColors = {
    'Apel': 'Merah',
    'Pisang': 'Kuning',
    'Jeruk': 'Oranye',
  };

  @override
  void initState() {
    super.initState();
    // Tunda pemanggilan _sendResults() ke frame berikutnya
    // setelah widget selesai dibangun sepenuhnya.
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _sendResults();
    });
  }

  void _sendResults() {
    // Pastikan widget masih ada sebelum memanggil setState di widget induk
    if (mounted) {
      widget.onResult({
        'Jumlah Buah': fruits.length,
        'Buah Pertama': fruits.isNotEmpty ? fruits.first : 'Tidak ada',
        'Jumlah Warna Buah': fruitColors.length,
        'Warna Apel': fruitColors['Apel'] ?? 'Tidak diketahui',
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List dan Map'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Daftar Buah (List<String>):',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: fruits.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    elevation: 2,
                    child: ListTile(
                      leading: Icon(Icons.check_circle_outline, color: Colors.green[400]),
                      title: Text(fruits[index], style: const TextStyle(fontSize: 16)),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 25.0),
            Text(
              'Warna Buah (Map<String, String>):',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: fruitColors.length,
                itemBuilder: (context, index) {
                  String key = fruitColors.keys.elementAt(index);
                  String? value = fruitColors[key];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    elevation: 2,
                    child: ListTile(
                      leading: Icon(Icons.color_lens, color: Colors.blue[400]),
                      title: Text('$key: $value', style: const TextStyle(fontSize: 16)),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  fruits.add('Mangga');
                  _sendResults();
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Menambahkan Mangga dan memperbarui hasil!')),
                );
              },
              icon: const Icon(Icons.add_circle),
              label: const Text('Tambahkan Mangga & Perbarui Hasil'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}