import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/main.dart';
import 'package:social_media_app/utils/custom_round_image/model/image_type_model.dart';

export 'package:social_media_app/utils/custom_round_image/model/image_type_model.dart';

class CustomRoundImage extends StatelessWidget {
  const CustomRoundImage(
      {super.key, required this.imageType, required this.imagePath});

  final ImageTypeModel imageType;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    switch (imageType) {
      case ImageTypeModel.asset:
        return CircleAvatar(
          maxRadius: appSizeConstants.radius_16,
          backgroundImage: AssetImage(imageData.noDataImage),
          foregroundImage: AssetImage(imagePath),
        );
        ;
      case ImageTypeModel.file:
        return CircleAvatar(
          maxRadius: appSizeConstants.radius_16,
          backgroundImage: AssetImage(imageData.noDataImage),
          foregroundImage: FileImage(File(imagePath)),
        );
        ;
      case ImageTypeModel.network:
        return CircleAvatar(
          maxRadius: appSizeConstants.radius_16,
          backgroundImage: AssetImage(imageData.noDataImage),
          foregroundImage: NetworkImage(imagePath),
        );
    }
  }
}
