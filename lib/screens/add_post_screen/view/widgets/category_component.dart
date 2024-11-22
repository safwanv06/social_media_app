import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/main.dart';
import 'package:social_media_app/screens/add_post_screen/controller/add_feed_controller.dart';
import 'package:social_media_app/screens/add_post_screen/service/service.dart';
import 'package:social_media_app/screens/home/view/widgets/category_chip.dart';
import 'package:social_media_app/utils/loading_screen/loading_screen.dart';
import 'package:social_media_app/utils/no_data_page/no_data_page.dart';

import '../../../home/service/model/model.dart';

class CategoryComponent extends StatelessWidget {
  CategoryComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddFeedProvider>(builder: (context, value, child) {
      return Column(
        children: [
          Row(
            children: [
              Text(
                "Categories This Project",
                style: fontStyles.text_14_400_FFFFFF,
              ),
              Spacer(),
              Text(
                "View all",
                style: fontStyles.text_14_400_FFFFFF,
              ),
              SizedBox(
                width: appSizeConstants.padding_8.w,
              ),
              Icon(
                Icons.arrow_circle_right_outlined,
                color: appColors.colorFFFFFF,
                size: appSizeConstants.iconSize_12,
              )
            ],
          ),
          SizedBox(
            height: appSizeConstants.padding_16.h,
          ),
          FutureBuilder(
            future: value.categories == null
                ? AddPostService.getCategories()
                : null,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingScreen();
              } else if (snapshot.hasData || value.categories != null) {
                value.categories = snapshot.data ?? value.categories;
                return Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: value.categories!.map(
                    (e) {
                      return InkWell(
                          onTap: () async {
                            await value.selectCategory(id: e.id);
                          },
                          child: CategoryChip(
                            name: e.categoryName,
                            borderColor:
                                value.selectedCategories?.contains(e.id) == true
                                    ? appColors.colorC70033
                                    : null,
                          ));
                    },
                  ).toList(),
                );
              } else {
                return const NoDataPage();
              }
            },
          )
        ],
      );
    });
  }
}
