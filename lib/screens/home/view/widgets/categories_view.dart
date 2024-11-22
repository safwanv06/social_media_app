import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/utils/custom_button/custom_button.dart';

import '../../../../main.dart';
import '../../service/model/model.dart';
import 'category_chip.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key, required this.categories});

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello Maria",
                  style: fontStyles.text_16_600_White,
                ),
                SizedBox(
                  height: appSizeConstants.padding_12.h,
                ),
                Text(
                  "Welcome back to Section",
                  style: fontStyles.text_12_400_BDBDBD,
                ),
              ],
            ),
            const Spacer(),
            Image.asset(imageData.dummyAvatar)
          ],
        ),
        SizedBox(
          height: appSizeConstants.padding_32.h,
        ),
        SizedBox(
          height: 70.h,
          child: ListView.builder(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  index == 0
                      ? CategoryChip(
                          name: "Explore",
                          bgColor: appColors.colorC70033.withOpacity(0.2),
                          borderColor: appColors.colorC70033.withOpacity(0.4),
                        )
                      : const SizedBox(),
                  index == 0
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: appSizeConstants.padding_8.h),
                          child: VerticalDivider(
                            color: appColors.colorBDBDBD,
                          ),
                        )
                      : const SizedBox(),
                  CategoryChip(
                    name: categories[index].categoryName,
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
