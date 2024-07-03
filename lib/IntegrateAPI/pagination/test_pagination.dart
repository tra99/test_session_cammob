import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_cammob/IntegrateAPI/provider/api_provider.dart';
import 'package:test_cammob/IntegrateAPI/service/home_screen_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeDataProvider>(context, listen: false).getAllHomeData();
    });
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
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
      body: Consumer<HomeDataProvider>(
        builder: (context, value, child) {
          if (value.isLoading && value.homeData.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final datas = value.homeData;
          return ListView.builder(
            padding: const EdgeInsets.all(10),
            controller: scrollController,
            itemCount: value.isLoading ? datas.length + 1 : datas.length,
            itemBuilder: (context, index) {
              if (index == datas.length) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              final data = datas[index];
              return Card(
                elevation: 2,
                color: Colors.white,
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPaginationPage(id: data.id, name: data.name, email: data.email, body: data.body, postId: data.postId)));
                  },
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text(
                      data.id.toString(),
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(data.email),
                  subtitle: Text(data.name),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _scrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      Provider.of<HomeDataProvider>(context, listen: false)
          .getAllHomeData(loadMore: true);
    }
  }
}

class DetailPaginationPage extends StatelessWidget {
  final int id;
  final String name;
  final String email;
  final String body;
  final int postId;
  const DetailPaginationPage({
    super.key,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
    required this.postId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Info Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("ID: $id"),
            Text("Name: $name"),
            Text("Email: $email"),
            Text("PostId: $postId"),
            Text("Paragrapg: $body"),
          ],
        ),
      ),
    );
  }
}
