import 'package:flutter/material.dart';
import 'package:tugas_akhir/main.dart'; // Untuk navigasi kembali ke LandingPage
import 'package:tugas_akhir/product.dart'; // Untuk navigasi ke OurProductPage
import 'package:tugas_akhir/about.dart'; // Untuk navigasi ke AboutPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      home: const NewsPage(),
    );
  }
}

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _heroImages = [
    'https://tse2.mm.bing.net/th/id/OIP.xfMjQxDelOsDAbcegSe24wHaEE?r=0&cb=thvnext&w=910&h=500&rs=1&pid=ImgDetMain&o=7&rm=3',
    'https://tse3.mm.bing.net/th/id/OIP.bUK4g2_WMX7Xc7wtDqN9YgHaFm?r=0&cb=thvnext&w=1012&h=766&rs=1&pid=ImgDetMain&o=7&rm=3',
    'https://tse2.mm.bing.net/th/id/OIP.DsyK4ito2zbc2V_7f_MR3AHaEc?r=0&cb=thvnext&w=650&h=390&rs=1&pid=ImgDetMain&o=7&rm=3',
  ];

  // Tambahkan daftar gambar untuk berita terbaru
  final List<String> _latestNewsImages = [
    'https://tse1.mm.bing.net/th/id/OIP._2BuZi3epnOc8HFuoFkKFQHaDO?r=0&cb=thvnext&w=850&h=370&rs=1&pid=ImgDetMain&o=7&rm=3',
    'https://tse3.mm.bing.net/th/id/OIP.Z8E7uFZRU5E5Ks_6k0xQWQHaEv?r=0&cb=thvnext&rs=1&pid=ImgDetMain&o=7&rm=3',
    'https://tse3.mm.bing.net/th/id/OIP.L71DAl4QZd9OoEhzL5AX0gHaFj?r=0&cb=thvnext&rs=1&pid=ImgDetMain&o=7&rm=3',
    'https://tse3.mm.bing.net/th/id/OIP.tlAih5j2q3N6eC7kOuD1GgHaE6?r=0&cb=thvnext&rs=1&pid=ImgDetMain&o=7&rm=3',
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
                                  child: Icon(Icons.article,
                                      size: 24, color: Colors.black54),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'News', // Judul halaman Berita
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
                                  (Route<dynamic> route) => false,
                            );
                          },
                          child: const Text('PRODUCTS',
                              style: TextStyle(color: Colors.black87))),
                      const SizedBox(width: 20),
                      TextButton(
                          onPressed: () {
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
                            // Stay on News Page
                          },
                          child: const Text('NEWS',
                              style: TextStyle(color: Colors.black87))),
                      const SizedBox(width: 20),
                      TextButton(
                          onPressed: () {
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
            const Divider(height: 1, thickness: 1),

            // Bagian 2: Hero Section (Gambar Utama Besar dengan Slider)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: _heroImages.length,
                        itemBuilder: (context, index) {
                          return Image.network(
                            _heroImages[index],
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
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 30),
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 30),
                      onPressed: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Row(
                      children: List.generate(_heroImages.length, (index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          width: 8.0,
                          height: 8.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index
                                ? Colors.blueAccent
                                : Colors.grey,
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, thickness: 1),

            // Bagian 3: News Grid Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'LATEST NEWS',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Dua kolom
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: 0.8, // Sesuaikan rasio aspek
                    ),
                    itemCount: _latestNewsImages.length, // Sesuaikan dengan jumlah gambar
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 120,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                            ),
                            child: Image.network(
                              _latestNewsImages[index], // Gunakan gambar dari daftar baru
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
                                    child: Icon(Icons.image, size: 40, color: Colors.black54),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Judul Berita Singkat',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Deskripsi singkat berita ini...',
                            style: TextStyle(fontSize: 12, color: Colors.black54),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                // Aksi untuk tombol CTA
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: const Text('READ MORE', style: TextStyle(fontSize: 12)),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            const Divider(height: 1, thickness: 1),

            // Bagian 4: Footer (Alamat dan Ikon Sosial Media)
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