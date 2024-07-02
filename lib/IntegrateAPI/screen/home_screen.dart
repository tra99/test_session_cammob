// import 'package:flutter/material.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
// import 'package:test_cammob/IntegrateAPI/model/home_model.dart';
// import 'package:test_cammob/IntegrateAPI/service/home_screen_service.dart';

// class HomeScreenAPI extends StatefulWidget {
//   const HomeScreenAPI({super.key});

//   @override
//   State<HomeScreenAPI> createState() => _HomeScreenAPIState();
// }

// class _HomeScreenAPIState extends State<HomeScreenAPI> {
//   static const _pageSize = 10;

//   final PagingController<int, HomeModel> _pagingController = PagingController(firstPageKey: 1);

//   @override
//   void initState() {
//     super.initState();
//     _pagingController.addPageRequestListener((pageKey) {
//       _fetchPage(pageKey);
//     });
//   }

//   Future<void> _fetchPage(int pageKey) async {
//     try {
//       print('Fetching page: $pageKey');
//       final newItems = await RemoteApiHomeData.fetchHomeData(pageKey, _pageSize);
//       print('Fetched items: ${newItems.length}');
//       final isLastPage = newItems.length < _pageSize;
//       if (isLastPage) {
//         _pagingController.appendLastPage(newItems);
//         print('Last page appended');
//       } else {
//         final nextPageKey = pageKey + 1; // Increment page key for next set of items
//         _pagingController.appendPage(newItems, nextPageKey);
//         print('Page $pageKey appended, next page key: $nextPageKey');
//       }
//     } catch (error) {
//       print('Error: $error');
//       _pagingController.error = error;
//     }
//   }

//   Future<void> refresh() async {
//     _pagingController.refresh();
//   }

//   @override
//   void dispose() {
//     _pagingController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: const Text(
//           "HomeScreen",
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: Colors.green,
//         centerTitle: true,
//       ),
//       body: RefreshIndicator(
//         onRefresh: refresh,
//         child: PagedListView<int, HomeModel>(
//           pagingController: _pagingController,
//           builderDelegate: PagedChildBuilderDelegate<HomeModel>(
//             itemBuilder: (context, item, index) => Card(
//               color: Colors.white,
//               child: ListTile(
//                 title: Row(
//                   children: [
//                     Text(
//                       item.id.toString(),
//                       style: const TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(width: 6),
//                     Expanded(
//                       child: Text(
//                         item.name,
//                         style: const TextStyle(fontWeight: FontWeight.bold),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ],
//                 ),
//                 subtitle: Text(item.body),
//               ),
//             ),
//             newPageProgressIndicatorBuilder: (context) => Center(
//               child: CircularProgressIndicator(),
//             ),
//             firstPageProgressIndicatorBuilder: (context) => Center(
//               child: CircularProgressIndicator(),
//             ),
//             noItemsFoundIndicatorBuilder: (context) => Center(
//               child: Text('No items found'),
//             ),
//             newPageErrorIndicatorBuilder: (context) => Center(
//               child: Text('Something went wrong, please try again later'),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:test_cammob/IntegrateAPI/service/home_screen_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int page=1;
  List posts=[];
  final scrollController=ScrollController();
  bool isLoading=false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
        itemCount: isLoading ? posts.length+1:posts.length,
        itemBuilder: (context,index){
          if(index<posts.length){
            final post=posts[index];
            final title=post['email'];
            final subtitle=post['name'];
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
            
          }
          else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
      }),
    );
  }

  Future<void> fetchData()async{
    try {
      final newPosts=await RemoteApiHomeData.fetchPosts(page);
      setState(() {
        posts=posts+newPosts;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _scrollListener()async{
    if(isLoading) return;
    if(scrollController.position.pixels==scrollController.position.maxScrollExtent){
      setState(() {
        isLoading=true;
      });
      page=page+1;
      await fetchData();
      setState(() {
        isLoading=false;
      });
    }
  }
}