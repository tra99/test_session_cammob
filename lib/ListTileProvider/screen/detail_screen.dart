import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String head1;
  final String head2;
  final ImageProvider img;

  const DetailScreen({
    super.key,
    required this.head1,
    required this.head2,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Screen",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image(
                image: img,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Text(
                "My title: $head1",
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "My subtitle: $head2",
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
