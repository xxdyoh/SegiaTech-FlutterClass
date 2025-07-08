import 'package:flutter/material.dart';
import 'package:tugas_flutter5/pages/lists_maps_page.dart';
import 'package:tugas_flutter5/pages/json_conversion_page.dart';
import 'package:tugas_flutter5/pages/async_operations_page.dart';
import 'package:tugas_flutter5/pages/shared_preferences_page.dart';
import 'package:tugas_flutter5/pages/http_rest_api_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Konsep Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, dynamic> _testResults = {};

  void updateTestResult(String testName, dynamic result) {
    setState(() {
      _testResults[testName] = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Konsep Flutter'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildButton(
                context,
                '1. List dan Map (Struktur Data)',
                ListsMapsPage(onResult: (result) => updateTestResult('List dan Map', result)),
                Icons.data_object,
              ),
              _buildButton(
                context,
                '2. Konversi JSON',
                JsonConversionPage(onResult: (result) => updateTestResult('Konversi JSON', result)),
                Icons.transform,
              ),
              _buildButton(
                context,
                '3. Operasi Asinkron',
                AsyncOperationsPage(onResult: (result) => updateTestResult('Operasi Asinkron', result)),
                Icons.sync,
              ),
              _buildButton(
                context,
                '4. SharedPreferences (Penyimpanan Lokal)',
                SharedPreferencesPage(onResult: (result) => updateTestResult('Shared Preferences', result)),
                Icons.save,
              ),
              _buildButton(
                context,
                '5. HTTP & REST API',
                HttpRestApiPage(onResult: (result) => updateTestResult('HTTP & REST API', result)),
                Icons.cloud,
              ),
              const SizedBox(height: 30),
              Text(
                'Hasil Tes:',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Divider(height: 20, thickness: 2),
              if (_testResults.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Belum ada hasil tes. Silakan jalankan beberapa tes dari tombol di atas!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
                  ),
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _testResults.entries.map((entry) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 6.0),
                      elevation: 3,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              entry.key,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blueAccent),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              entry.value.toString(),
                              style: const TextStyle(fontSize: 15, color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Widget page, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        icon: Icon(icon, size: 28),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 5,
        ),
      ),
    );
  }
}