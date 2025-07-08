import 'package:flutter/material.dart';
import 'package:tugas_akhir/main.dart'; // For navigating back to LandingPage
import 'package:tugas_akhir/product.dart'; // For navigating to OurProductPage
import 'package:tugas_akhir/news.dart'; // Impor NewsPage yang baru

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'About Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      home: const AboutPage(),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Bagian 1: Header (Navigation Bar & Page Title) - Consistent with main.dart and product.dart
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
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
                      const SizedBox(width: 10),
                      const Text(
                        'About', // Page title for About page
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
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => const OurProductPage()),
                                  (Route<dynamic> route) => false, // Clears the stack
                            );
                          },
                          child: const Text('PRODUCTS',
                              style: TextStyle(color: Colors.black87))),
                      const SizedBox(width: 20),
                      TextButton(
                          onPressed: () {
                            // Stay on About Page
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
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => const LandingPage()),
                                  (Route<dynamic> route) => false, // Clears the stack
                            );
                          },
                          child: const Text('CONTACT',
                              style: TextStyle(color: Colors.black87))),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(height: 1, thickness: 1),

            // ... (sisa about.dart tetap sama) ...
            // Bagian 2: Short Statement About The Team
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  color: Colors.grey[100],
                ),
                padding: const EdgeInsets.all(16.0),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'SHORT STATEMENT ABOUT THE TEAM',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const Divider(height: 1, thickness: 1),

            // Bagian 3: Our Team Section (Grid of Members)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'OUR TEAM',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 0.0,
                      childAspectRatio: 0.9,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 90,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                            ),
                            child: Image.network(
                              'https://via.placeholder.com/90x90/CCCCCC/000000?text=Member+${index + 1}',
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
                                    child: Icon(Icons.person, size: 30, color: Colors.black54),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'NAME SURNAME',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                            textAlign: TextAlign.center,
                          ),
                          const Text(
                            'Position',
                            style: TextStyle(fontSize: 11, color: Colors.black54),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            const Divider(height: 1, thickness: 1),

            // Bagian 4: Short Statement About The Company
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  color: Colors.grey[100],
                ),
                padding: const EdgeInsets.all(16.0),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'SHORT STATEMENT ABOUT THE COMPANY',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const Divider(height: 1, thickness: 1),

            // Bagian 5: History Section (Two columns of text)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'HISTORY',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            color: Colors.grey[100],
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                            style: TextStyle(fontSize: 14, color: Colors.black54),
                            maxLines: 6,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            color: Colors.grey[100],
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.',
                            style: TextStyle(fontSize: 14, color: Colors.black54),
                            maxLines: 6,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(height: 1, thickness: 1),

            // Bagian 6: Footer (Alamat dan Ikon Sosial Media) - Consistent with main.dart and product.dart
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