import 'package:flutter/material.dart';
import 'package:tugas_akhir/main.dart'; // Impor main.dart untuk navigasi kembali ke LandingPage
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
      title: 'Our Product',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      home: const OurProductPage(),
    );
  }
}

class OurProductPage extends StatelessWidget {
  const OurProductPage({super.key});

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
                                  child: Icon(Icons.business,
                                      size: 24, color: Colors.black54),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 10), // Space between logo and title
                      const Text(
                        'Our Product', // Page title for Our Product page
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
                            // Sudah di OurProductPage, bisa tidak melakukan apa-apa atau gulir ke atas
                          },
                          child: const Text('PRODUCTS',
                              style: TextStyle(color: Colors.black87))),
                      const SizedBox(width: 20),
                      TextButton(
                          onPressed: () {
                            // Navigasi ke About Page
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => const AboutPage()),
                                  (Route<dynamic> route) => false,
                            );
                          },
                          child: const Text('ABOUT',
                              style: TextStyle(color: Colors.black87))),
                      const SizedBox(width: 20),
                      TextButton(
                          onPressed: () {
                            // Navigasi ke News Page
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => const NewsPage()),
                                  (Route<dynamic> route) => false,
                            );
                          },
                          child: const Text('NEWS',
                              style: TextStyle(color: Colors.black87))),
                      const SizedBox(width: 20),
                      TextButton(
                          onPressed: () {
                            // Navigasi ke Landing Page (main.dart) untuk bagian Kontak
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => const LandingPage()),
                                  (Route<dynamic> route) => false,
                            );
                          },
                          child: const Text('CONTACT',
                              style: TextStyle(color: Colors.black87))),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(height: 1, thickness: 1), // Menambahkan divider tipis

            // ... (sisa product.dart tetap sama) ...
            // Bagian 2: Hero Section (Gambar Utama Besar)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container( // Using Container for border to mimic wireframe
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    'https://tse4.mm.bing.net/th/id/OIP.0uSqFnT4vpmXXzWrY8yKCwHaCQ?r=0&cb=thvnext&rs=1&pid=ImgDetMain&o=7&rm=3', // Placeholder image
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
                          child: Text('Image Placeholder',
                              style: TextStyle(color: Colors.black54)),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            // Bagian 3: Highlight #1 Section
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
                      border: Border.all(color: Colors.grey, width: 1), // Border to mimic wireframe
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0), // No border radius as per wireframe
                      child: Image.network(
                        'https://tse3.mm.bing.net/th/id/OIP.L71DAl4QZd9OoEhzL5AX0gHaFj?r=0&cb=thvnext&rs=1&pid=ImgDetMain&o=7&rm=3', // Placeholder image
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
                              child: Text('Image',
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
                          'HIGHLIGHT #1',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        SizedBox( // Constrain button width
                          width: 80, // Adjust as needed
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero, // Remove default padding
                              minimumSize: Size.zero, // Remove default minimum size
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Shrink tap target
                            ),
                            child: const Text('SEE MORE', style: TextStyle(fontSize: 12)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, thickness: 1),

            // Bagian 4: Highlight #2 Section (Image on right)
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'HIGHLIGHT #2',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        SizedBox( // Constrain button width
                          width: 80, // Adjust as needed
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero, // Remove default padding
                              minimumSize: Size.zero, // Remove default minimum size
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Shrink tap target
                            ),
                            child: const Text('SEE MORE', style: TextStyle(fontSize: 12)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1), // Border to mimic wireframe
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.network(
                        'https://tse3.mm.bing.net/th/id/OIP.Z8E7uFZRU5E5Ks_6k0xQWQHaEv?r=0&cb=thvnext&rs=1&pid=ImgDetMain&o=7&rm=3', // Placeholder image
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
                              child: Text('Image',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.black54)),
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

            // Bagian 5: Highlight #3 Section
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
                      border: Border.all(color: Colors.grey, width: 1), // Border to mimic wireframe
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.network(
                        'https://tse3.mm.bing.net/th/id/OIP.tlAih5j2q3N6eC7kOuD1GgHaE6?r=0&cb=thvnext&rs=1&pid=ImgDetMain&o=7&rm=3', // Placeholder image
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
                              child: Text('Image',
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
                          'HIGHLIGHT #3',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        SizedBox( // Constrain button width
                          width: 80, // Adjust as needed
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero, // Remove default padding
                              minimumSize: Size.zero, // Remove default minimum size
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Shrink tap target
                            ),
                            child: const Text('SEE MORE', style: TextStyle(fontSize: 12)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, thickness: 1),

            // Bagian 6: Details Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'DETAILS',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 150, // Adjust height as needed
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1), // Border to mimic wireframe
                      color: Colors.grey[100],
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        style: TextStyle(color: Colors.black54),
                        maxLines: 8, // Adjust based on desired text length
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, thickness: 1),

            // Bagian 7: Footer (Address and Social Media Icons)
            Container(
              width: double.infinity,
              color: Colors.grey[900], // Dark grey footer
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
                          icon: const Icon(Icons.camera_alt, // Instagram-like icon
                              color: Colors.white,
                              size: 30)),
                      const SizedBox(width: 20),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.mail, // Email icon
                              color: Colors.white,
                              size: 30)),
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