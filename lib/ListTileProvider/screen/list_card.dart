import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_cammob/ListTileProvider/screen/detail_screen.dart';

import '../components/card_widget.dart';
import '../provider/test_card_provider.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          "List Card",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer<TestCardProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.cards.length,
            itemBuilder: (context, index) {
              final card = provider.cards[index];
              return TestCard(
                head1: card.head1,
                head2: card.head2,
                img: card.img,
                delete: Icons.delete,
                click: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        head1: card.head1,
                        head2: card.head2,
                        img: card.img,
                      ),
                    ),
                  );
                },
                deleteCallback: () {
                  provider.deleteCard(index);
                },
              );
            },
          );
        },
      ),
    );
  }
}
