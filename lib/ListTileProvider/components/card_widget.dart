import 'package:flutter/material.dart';

class TestCard extends StatelessWidget {
  const TestCard({
    super.key,
    required this.head1,
    required this.head2,
    required this.img,
    required this.delete,
    required this.click,
    required this.deleteCallback,
  });

  final String head1;
  final String head2;
  final ImageProvider img;
  final IconData delete;
  final VoidCallback click;
  final VoidCallback deleteCallback;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        onTap: click,
        title: Text(head1),
        trailing: IconButton(
          icon: Icon(delete),
          onPressed: deleteCallback,
        ),
        subtitle: Text(
          head2,
          style: const TextStyle(color: Colors.grey),
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image(
            image: img,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
