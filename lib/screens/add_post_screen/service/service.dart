import 'dart:developer';
import 'dart:io';

import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:social_media_app/main.dart';
import 'package:social_media_app/utils/middleware/dio_api_handler/dio_api_handler.dart';

import '../../home/service/model/model.dart';

class AddPostService {
  static Future<List<CategoryModel>> getCategories() async {
    try {
      Response response = await dioApiCall().get(apiRoutes.category_list);
      if (response.statusCode == 202) {
        List<CategoryModel> categories = [];
        List data = response.data["categories"];
        for (Map element in data) {
          categories.add(CategoryModel(
              id: element["id"].toString(), categoryName: element["title"]));
        }
        return categories;
      } else {
        throw Error();
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> sharePost(
      {required File videoFile,
      required File imageFile,
      required List<String> selectedCategories}) async {
    try {
      FormData formData = FormData.fromMap({
        "video": await MultipartFile.fromFile(videoFile.path,
            contentType: MediaType("video", videoFile.path.split(".").last)),
        "image": await MultipartFile.fromFile(imageFile.path,
            contentType: MediaType("image", imageFile.path.split(".").last)),
        "desc": "Any description",
        "category": selectedCategories
      });
      Response response =
          await dioApiCall().post(apiRoutes.add_feed, data: formData);
      if (response.statusCode == 202) {
        return true;
      } else {
        throw Error();
      }
    } catch (e) {
      log("the error ios $e");
      rethrow;
    }
  }
}
