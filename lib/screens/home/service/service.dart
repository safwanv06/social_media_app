import 'package:dio/dio.dart';
import 'package:social_media_app/main.dart';
import 'package:social_media_app/utils/middleware/dio_api_handler/dio_api_handler.dart';

import 'model/model.dart';

class HomeService {
  static Future<HomeDataModel> getHomeData() async {
    try {
      Response response = await dioApiCall().get(apiRoutes.home);
      if (response.statusCode == 202) {
        List<CategoryModel> categories = [];
        List<PostModel> posts = [];
        List categoryData = response.data["category_dict"];
        List postData = response.data["results"];

        for (Map element in categoryData) {
          categories.add(
              CategoryModel(id: element["id"], categoryName: element["title"]));
        }

        for (Map element in postData) {
          posts.add(PostModel(
              id: element["id"].toString(),
              description: element["description"],
              imageUrl: element["image"],
              videoUrl: element["video"],
              createdAt: DateTime.parse(element["created_at"]),
              user: UserModel(
                  id: element["user"]["id"].toString(),
                  name: element["user"]["name"],
                  image: element["user"]["image"])));
        }

        return HomeDataModel(categories: categories, posts: posts);
      } else {
        throw Error();
      }
    } catch (e) {
      print("the e is $e");
      rethrow;
    }
  }
}
