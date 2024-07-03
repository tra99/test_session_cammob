// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_cammob/IntegrateAPI/pagination/test_pagination.dart';
// import 'package:test_cammob/ProviderCourse/providers/change_name_provider.dart';

// class ProviderClass extends ChangeNotifier{
//   String name="Chetra";
//   String get _name=>name;

//   void update({required String newName})async{
//     name=newName;
//     notifyListeners();
//   }
// }

// class UpdateName extends StatelessWidget {
//   UpdateName({super.key});

//   final nameContoller=TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: Text("Update Name"),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Consumer<ProviderClass>(builder: (context,proiverClass,child){
//             return Text(proiverClass.name);
//           }),
//           SizedBox(height: 200,),
//           TextField(
//             controller: nameContoller,
//             decoration: InputDecoration(
//               label:Text("name ")
//             ),
//           ),
//           SizedBox(height: 200,),
//           TextButton(onPressed: (){
//             String newN=nameContoller.text;
//             context.read<ProviderClass>().update(newName: newN);
//           }, child: Text("Update")),
//           TextButton(onPressed: (){
//             Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateNameFromScreen()));
//           }, child: Text("Push"))
//         ],
//       ),
//     );
//   }
// }

// class UpdateNameFromScreen extends StatelessWidget {
//   UpdateNameFromScreen({super.key});

//   final nameContoller=TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: Text("Update Name"),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Consumer<ProviderClass>(builder: (context,proiverClass,child){
//             return Text(proiverClass.name);
//           }),
//           SizedBox(height: 200,),
//           TextField(
//             controller: nameContoller,
//             decoration: InputDecoration(
//               label:Text("name ")
//             ),
//           ),
//           SizedBox(height: 200,),
//           TextButton(onPressed: (){
//             String newN=nameContoller.text;
//             context.read<ProviderClass>().update(newName: newN);
//           }, child: Text("Update"))
//         ],
//       ),
//     );
//   }
// }

class ProviderModel {
  final String subtitle;
  final String title;
  final ImageProvider image;
  final IconData icon;
  final IconData delete;
  ProviderModel({
    required this.subtitle,
    required this.title,
    required this.image,
    required this.icon,
    required this.delete,
  });
}

class ListProvider extends ChangeNotifier {
  late ProviderModel providerModel;
  final List<ProviderModel> _items = List.generate(
      20,
      (index) => ProviderModel(
          subtitle: "Subtitle${index + 1}",
          title: 'Title${index + 1}',
          image: const AssetImage("assets/jpg/profile.jpg"),
          icon: Icons.edit_outlined,
          delete: Icons.delete));

  List<ProviderModel> get items => _items;

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void updateItem(int index,String subtitle, String title, ImageProvider image,IconData icon,IconData delete) {
    _items[index] = ProviderModel(
        subtitle: subtitle,
        title: title,
        image: image,
        icon: icon,
        delete: delete
      );
    notifyListeners();
  }
}

class ListCardItems extends StatelessWidget {
  const ListCardItems({super.key});

  @override
  Widget build(BuildContext context) {
    
    final TextEditingController _titleController=TextEditingController();
    final TextEditingController _subTitleController=TextEditingController();

    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: const Text("List Cards",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text("API",style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),),
              ),
            )
          ],
        ),
        body: Consumer<ListProvider>(builder: (context, provide, child) {
          return ListView.builder(
              itemCount: provide.items.length,
              itemBuilder: (context, index) {
                final data = provide.items[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 6, right: 6),
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailOfListScreen(
                                  
                                  title: data.title,
                                  subtitle: data.subtitle,
                                  image: data.image,
                        )));
                      },
                      title: Text(data.title),
                      subtitle: Text(data.subtitle),
                      leading: Image(image: data.image),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(data.icon),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(data.title),
                                        TextField(
                                          controller: _titleController,
                                          decoration: const InputDecoration(
                                            hintText: 'Update Title',
                                          ),
                                        ),
                                        const SizedBox(height: 30,),
                                        Text(data.subtitle),
                                        TextField(
                                          controller: _subTitleController,
                                          decoration: const InputDecoration(
                                            hintText: "Update subtile",
                                          ),
                                        ),
                                      ],
                                    ),
                                    backgroundColor: const Color(0xFFEFEFEF),
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(color: Colors.green, width: 2),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    actions: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          TextButton(onPressed: (){
                                            Navigator.of(context).pop();
                                          }, child: const Text("Cancel")),
                                          TextButton(
                                            child: const Text('Update'),
                                            onPressed: () {
                                              String newTitle=_titleController.text;
                                              String newSubtitle=_subTitleController.text;
                                              context.read<ListProvider>().updateItem(index, newSubtitle,newTitle, data.image, data.icon, data.delete);
                                          
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(data.delete),
                            onPressed: () {
                              provide.removeItem(index);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        }));
  }
}

class DetailOfListScreen extends StatelessWidget {
  final String subtitle;
  final String title;
  final ImageProvider image;

  const DetailOfListScreen({
    super.key,
    required this.subtitle,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Screen",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(image: image),
              )
            ),
          Center(
            child: Column(
              children: [
                Text("Header: $title"),
                Text("Paragraph: $subtitle"),
              ],
            ),
          )
        ],
      ),
    );
  }

}
