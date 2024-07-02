// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
  
//   final scrollController=ScrollController();
//   List posts = [];
//   int page=1;
//   bool isLoading=false;

//   @override
//   void initState() {
//     super.initState();
//     scrollController.addListener(_scrollListener);
//     fetchPosts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: const Text(
//           "Pagination",
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//         padding: EdgeInsets.all(10),
//         controller: scrollController,
//           itemCount:isLoading?  posts.length+1:posts.length,
//           itemBuilder: (context, index) {
//            if(index<posts.length){
//             final post = posts[index];
//             final title = post['email'];
//             final subtitle = post['name'];
//             return Card(
//               elevation: 2,
//               color: Colors.white,
//               child: ListTile(
//                 leading: CircleAvatar(
//                   backgroundColor: Colors.blue,
//                   child: Text("${index+1}", style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),),
//                 ),
//                 title: Text("$title"),
//                 subtitle: Text('$subtitle'),
//               ),
//             );
//            }else{
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//            }
//           }
//         ),
//     );
//   }

//   Future<void> fetchPosts() async {
//     final url =
//         'https://jsonplaceholder.typicode.com/comments?_page=$page&_limit=10';
//         print("$url");
//     final uri = Uri.parse(url);
//     final response = await http.get(uri);
//     if (response.statusCode == 200) {
//       final List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;
//       setState(() {
//         posts = posts+jsonList;
//       });
//     } else {

//     }
//   }

//   Future<void> _scrollListener()async{
//     if(isLoading) return;
//     if(scrollController.position.pixels==scrollController.position.maxScrollExtent){
//       setState(() {
//         isLoading=true;
//       });
//       page=page+1;
//       await fetchPosts();
//       setState(() {
//         isLoading=false;
//       });
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:test_cammob/IntegrateAPI/service/home_screen_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollController = ScrollController();
  List posts = [];
  int page = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Pagination",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        controller: scrollController,
        itemCount: isLoading ? posts.length + 1 : posts.length,
        itemBuilder: (context, index) {
          if (index < posts.length) {
            final post = posts[index];
            final title = post['email'];
            final subtitle = post['name'];
            return Card(
              elevation: 2,
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    "${index + 1}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text("$title"),
                subtitle: Text('$subtitle'),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<void> fetchPosts() async {
    try {
      final newPosts = await RemoteApiHomeData.fetchPosts(page);
      setState(() {
        posts = posts + newPosts;
      });
    } catch (e) {
      print(e); // Handle error appropriately
    }
  }

  Future<void> _scrollListener() async {
    if (isLoading) return;
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      setState(() {
        isLoading = true;
      });
      page = page + 1;
      await fetchPosts();
      setState(() {
        isLoading = false;
      });
    }
  }
}
