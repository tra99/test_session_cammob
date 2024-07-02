class HomeModel {
  final int id;
  final String name;
  final String email;
  final String body;
  final int postId;

  HomeModel({
    required this.id,
    required this.name,
    required this.email,
    required this.body,
    required this.postId,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      body: json["body"],
      postId: json["postId"],
    );
  }
}
