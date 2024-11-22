import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/screens/home/service/model/model.dart';

class AddFeedProvider extends ChangeNotifier {
  File? imageFile;

  File? videoFile;

  List<CategoryModel>? categories;

  List<String>? selectedCategories;

  pickImageFile() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      imageFile = File(file.path);
      notifyListeners();
    }
  }

  pickVideoFile() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickVideo(source: ImageSource.gallery);
    if (file != null) {
      videoFile = File(file.path);
      notifyListeners();
    }
  }

selectCategory({required String id}) async {
    if(selectedCategories==null){
      selectedCategories=[id];
    }
    else{
      selectedCategories!.add(id);
    }
    notifyListeners();
  }



  resetState() {
    imageFile = null;
    videoFile = null;
    categories = null;
    selectedCategories = null;
    notifyListeners();
  }
}
