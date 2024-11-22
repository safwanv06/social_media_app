import 'dart:io';

class AddFeedController {
  static bool validation({
    required File? videoFile,
    required File? imageFile,
    required List? categories,
  }) {
    return videoFile != null &&
        imageFile != null &&
        (categories != null &&
        categories.isNotEmpty);
  }
}
