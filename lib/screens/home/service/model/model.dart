class HomeDataModel {
  HomeDataModel({required this.categories, required this.posts});

  List<CategoryModel> categories;
  List<PostModel> posts;
}

class CategoryModel {
  CategoryModel({required this.id, required this.categoryName});

  String id;
  String categoryName;
}

class PostModel {
  PostModel({
    required this.id,
    required this.description,
    required this.imageUrl,
    required this.videoUrl,
    required this.createdAt,
    required this.user,
  });

  String id;
  String description;
  String imageUrl;
  String videoUrl;
  DateTime createdAt;
  UserModel user;
}

class UserModel {
  UserModel({required this.id, required this.name, required this.image});

  String id;
  String name;
  String? image;
}
