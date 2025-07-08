import 'package:flutter/material.dart';
import 'package:tugas_flutter5/models/user_model.dart';
import 'package:tugas_flutter5/services/api_service.dart';
import 'package:flutter/scheduler.dart'; // Import ini untuk SchedulerBinding

class HttpRestApiPage extends StatefulWidget {
  final Function(String) onResult;

  const HttpRestApiPage({super.key, required this.onResult});

  @override
  State<HttpRestApiPage> createState() => _HttpRestApiPageState();
}

class _HttpRestApiPageState extends State<HttpRestApiPage> {
  final ApiService _apiService = ApiService();
  List<User> _users = [];
  bool _isLoading = false;
  String _errorMessage = '';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _fetchUsers();
    });
  }

  Future<void> _fetchUsers() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });
    try {
      final users = await _apiService.fetchUsers();
      setState(() {
        _users = users;
        _isLoading = false;
      });
      if (mounted) { // Tambahkan pengecekan mounted
        widget.onResult('Berhasil mengambil ${_users.length} pengguna.');
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error mengambil pengguna: $e';
        _isLoading = false;
      });
      if (mounted) { // Tambahkan pengecekan mounted
        widget.onResult('Gagal mengambil pengguna: $e');
      }
    }
  }

  Future<void> _createUser() async {
    if (_nameController.text.isEmpty || _emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nama dan Email tidak boleh kosong!')),
      );
      if (mounted) { // Tambahkan pengecekan mounted
        widget.onResult('Mencoba membuat pengguna, tetapi nama/email kosong.');
      }
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final newUser = User(
        id: DateTime.now().millisecondsSinceEpoch,
        name: _nameController.text,
        email: _emailController.text,
      );
      final createdUser = await _apiService.createUser(newUser);
      setState(() {
        _users.add(createdUser);
        _isLoading = false;
        _nameController.clear();
        _emailController.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Pengguna ${createdUser.name} berhasil dibuat!')),
      );
      if (mounted) { // Tambahkan pengecekan mounted
        widget.onResult('Berhasil membuat pengguna: ${createdUser.name} (ID: ${createdUser.id})');
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error membuat pengguna: $e';
        _isLoading = false;
      });
      if (mounted) { // Tambahkan pengecekan mounted
        widget.onResult('Gagal membuat pengguna: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP & REST API'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Tambahkan Pengguna Baru:',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nama Pengguna',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email Pengguna',
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton.icon(
              onPressed: _isLoading ? null : _createUser,
              icon: _isLoading
                  ? SizedBox( // Tidak ada 'const' di sini
                width: 20,
                height: 20,
                child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
              )
                  : Icon(Icons.person_add), // Tidak ada 'const' di sini
              label: Text(_isLoading ? 'Membuat...' : 'Buat Pengguna Baru (POST)'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 30.0),
            Text(
              'Daftar Pengguna Dari API (GET):',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            if (_isLoading && _users.isEmpty)
              const Center(child: CircularProgressIndicator())
            else if (_errorMessage.isNotEmpty)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _errorMessage,
                    style: const TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            else if (_users.isEmpty)
                const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('Belum ada pengguna yang diambil. Tarik ke bawah untuk refresh.', style: TextStyle(fontStyle: FontStyle.italic)),
                    ))
              else
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: _fetchUsers,
                    child: ListView.builder(
                      itemCount: _users.length,
                      itemBuilder: (context, index) {
                        final user = _users[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 6.0),
                          elevation: 2,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                            leading: CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              child: Text(user.id.toString(), style: const TextStyle(color: Colors.white)),
                            ),
                            title: Text(user.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                            subtitle: Text(user.email, style: TextStyle(fontSize: 14, color: Colors.grey[700])
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}