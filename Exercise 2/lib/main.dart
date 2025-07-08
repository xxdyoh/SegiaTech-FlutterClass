import 'package:flutter/material.dart';
import 'package:tugas_akhir/product.dart'; // Pastikan path ini benar
import 'package:tugas_akhir/about.dart'; // Impor AboutPage yang baru
import 'package:tugas_akhir/news.dart'; // Impor NewsPage yang baru

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Landing Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Bagian 1: Header (Navigation Bar & Page Title)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row( // Group logo and page title
                    children: [
                      // Logo/Gambar di Header
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: ClipOval(
                          child: Image.network(
                            'https://via.placeholder.com/40x40/0000FF/FFFFFF?text=Logo',
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                      : null,
                                  strokeWidth: 2,
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[300],
                                child: const Center(
                                  child: Icon(Icons.person,
                                      size: 24, color: Colors.black54),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 10), // Space between logo and title
                      const Text(
                        'Landing Page', // Added page title
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  // Tombol navigasi
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            // Navigate to the Product Page
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const OurProductPage()),
                            );
                          },
                          child: const Text('PRODUCTS',
                              style: TextStyle(color: Colors.black87))),
                      const SizedBox(width: 20),
                      TextButton(
                          onPressed: () {
                            // Navigate to the About Page
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const AboutPage()),
                            );
                          },
                          child: const Text('ABOUT',
                              style: TextStyle(color: Colors.black87))),
                      const SizedBox(width: 20),
                      TextButton(
                          onPressed: () {
                            // Navigate to the News Page
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const NewsPage()),
                            );
                          },
                          child: const Text('NEWS',
                              style: TextStyle(color: Colors.black87))),
                      const SizedBox(width: 20),
                      TextButton(
                          onPressed: () {
                            // Stay on Landing Page, perhaps scroll to Contact section later
                            // For now, it just doesn't navigate away.
                          },
                          child: const Text('CONTACT',
                              style: TextStyle(color: Colors.black87))),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(height: 1, thickness: 1),

            // ... (sisa main.dart tetap sama) ...
            // Bagian 2: Hero Section (Gambar Utama Besar)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    'https://tse4.mm.bing.net/th/id/OIP.0uSqFnT4vpmXXzWrY8yKCwHaCQ?r=0&cb=thvnext&rs=1&pid=ImgDetMain&o=7&rm=3/600x338',
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: Text('Gagal memuat gambar dari URL',
                              style: TextStyle(color: Colors.black54)),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            // Bagian 3: Product #1 Section (Gambar Kecil + Teks + SEE MORE + Deskripsi)
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.network(
                        'https://tse3.mm.bing.net/th/id/OIP.L71DAl4QZd9OoEhzL5AX0gHaFj?r=0&cb=thvnext&rs=1&pid=ImgDetMain&o=7&rm=3/100x100',
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: const Center(
                              child: Text('Gagal',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.black54)),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Gundam Model Kit',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: 80,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: const Text('SEE MORE', style: TextStyle(fontSize: 12)),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, thickness: 1),

            // Bagian 4: Product Description Section (Teks + SEE MORE + Deskripsi + Gambar Kecil dari Web)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'PRODUCT DESCRIPTION',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: 80,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: const Text('SEE MORE', style: TextStyle(fontSize: 12)),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.network(
                        'https://tse3.mm.bing.net/th/id/OIP.Z8E7uFZRU5E5Ks_6k0xQWQHaEv?r=0&cb=thvnext&rs=1&pid=ImgDetMain&o=7&rm=3/150x150',
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: const Center(
                              child: Text('Gagal',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54)),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, thickness: 1),

            // Bagian 5: About Us Section (Teks 'ABOUT US' dan Deskripsi)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ABOUT US',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      color: Colors.grey[100],
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                        style: TextStyle(color: Colors.black54),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, thickness: 1),

            // Bagian 6: Footer (Alamat dan Ikon Sosial Media)
            Container(
              width: double.infinity,
              color: Colors.grey[900],
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Text(
                    'ADDRESS',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.facebook,
                              color: Colors.white, size: 30)),
                      const SizedBox(width: 20),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.camera_alt,
                              color: Colors.white, size: 30)),
                      const SizedBox(width: 20),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.mail,
                              color: Colors.white, size: 30)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}