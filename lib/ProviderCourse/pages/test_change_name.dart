import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_cammob/ProviderCourse/providers/change_name_provider.dart';

class TestChangeNameProvider extends StatelessWidget {
  const TestChangeNameProvider({super.key});

  @override
  Widget build(BuildContext context) {

    final TextEditingController _userNameController=TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Username"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(context.watch<ChangeNameProvider>().username.toString(),style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            ),
            const SizedBox(height: 200,),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: TextField(
                controller: _userNameController,
                decoration: const InputDecoration(
                  label: Text("Username"),
                ),
              ),
            ),
            const SizedBox(height: 100,),
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 17, 102, 20),
                borderRadius: BorderRadius.circular(20)
              ),
              child: TextButton(
                onPressed: (){
                  String newName=_userNameController.text;
                  context.read<ChangeNameProvider>().ChangeName(newUserName: newName);
              }, 
              child: const Text("Update",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
              ),
            )
          ],
        ),
      ),
    );
  }
}