import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String email;
  final String name;
  final String password;

  ResultPage({
    required this.email,
    required this.name,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Result'),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                'https://th.bing.com/th/id/R.f53e4c9bbcdd4ab28d273336cbb1470c?rik=r%2fkPUjSSe50r1g&riu=http%3a%2f%2fmercubuana-yogya.ac.id%2fassets%2fimg%2flogo.png&ehk=%2fWPlM8QDwcRus0iOGEboepuFaGbn2OuSVRAAILzkJuU%3d&risl=&pid=ImgRaw&r=0',
                width: 200,
                height: 200,
                fit: BoxFit.contain,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                  return Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                    ),
                    child: Icon(
                      Icons.broken_image,
                      size: 100,
                      color: Colors.red,
                    ),
                  );
                },
              ),
              SizedBox(height: 40),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Registration Details:',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15),
                      Text('Email: $email', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 10),
                      Text('Name: $name', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 10),
                      Text('Password: $password', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
