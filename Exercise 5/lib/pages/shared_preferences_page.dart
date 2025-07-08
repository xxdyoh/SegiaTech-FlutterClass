import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/scheduler.dart'; // Import ini untuk SchedulerBinding

class SharedPreferencesPage extends StatefulWidget {
  final Function(String) onResult;

  const SharedPreferencesPage({super.key, required this.onResult});

  @override
  State<SharedPreferencesPage> createState() => _SharedPreferencesPageState();
}

class _SharedPreferencesPageState extends State<SharedPreferencesPage> {
  final TextEditingController _textController = TextEditingController();
  String _savedData = 'Belum ada data tersimpan.';

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _loadData(); // _loadData() yang akan memanggil widget.onResult
    });
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedData = prefs.getString('data_pengguna_saya') ?? 'Belum ada data tersimpan.';
    });
    if (mounted) { // Tambahkan pengecekan mounted
      widget.onResult('Data dimuat: "$_savedData"');
    }
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('data_pengguna_saya', _textController.text);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data berhasil disimpan!')),
    );
    await _loadData(); // Reload to update displayed data and send result
    if (mounted) { // Tambahkan pengecekan mounted
      widget.onResult('Data disimpan: "${_textController.text}"');
    }
  }

  Future<void> _clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('data_pengguna_saya');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data berhasil dihapus!')),
    );
    await _loadData(); // Reload to update displayed data and send result
    if (mounted) { // Tambahkan pengecekan mounted
      widget.onResult('Data dihapus. Data saat ini: "$_savedData"');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preferences'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukkan data yang ingin disimpan',
                prefixIcon: Icon(Icons.edit),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton.icon(
              onPressed: _saveData,
              icon: const Icon(Icons.save),
              label: const Text('Simpan Data'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton.icon(
              onPressed: _loadData,
              icon: const Icon(Icons.download),
              label: const Text('Muat Data'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton.icon(
              onPressed: _clearData,
              icon: const Icon(Icons.delete_forever),
              label: const Text('Hapus Data'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: const EdgeInsets.symmetric(vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 30.0),
            Text(
              'Data Tersimpan Saat Ini:',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Container(
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.lightBlue[50],
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.lightBlue.shade200, width: 1.5),
              ),
              child: Text(
                _savedData,
                style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}