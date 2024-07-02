import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:test_cammob/main.dart';
import 'package:test_cammob/ProviderCourse/providers/conuter_provider.dart';

class TestPageProvider extends StatelessWidget {
  const TestPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Provider"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(context.watch<ConuterProvider>().value.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                onPressed: (){
                  context.read<ConuterProvider>().decrementCounter();
                },
                child: Icon(Icons.minimize),
              ),
              FloatingActionButton(
                onPressed: (){
                  context.read<ConuterProvider>().incrementCounter();
                },
                child: Icon(Icons.add),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}