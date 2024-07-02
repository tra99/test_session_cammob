import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../provider/user_provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _usernameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Change Username"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<UserCubit, String>(
            builder: (context, state) {
              return Text(
                state,
                style: TextStyle(fontSize: 20),
              );
            },
          ),
          SizedBox(height: 20),
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: "Username",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 17, 102, 20),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextButton(
              onPressed: () {
                String newUserName = _usernameController.text;
                context.read<UserCubit>().updateName(newUserName: newUserName);
              },
              child: Text(
                "Update",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
