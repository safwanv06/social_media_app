import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/main.dart';
import 'package:social_media_app/screens/add_post_screen/view/add_post_view.dart';
import 'package:social_media_app/screens/home/service/model/model.dart';
import 'package:social_media_app/screens/home/service/service.dart';
import 'package:social_media_app/screens/home/view/widgets/add_post_button.dart';
import 'package:social_media_app/screens/home/view/widgets/categories_view.dart';
import 'package:social_media_app/screens/home/view/widgets/post_view/posts_view.dart';
import 'package:social_media_app/utils/loading_screen/loading_screen.dart';
import 'package:social_media_app/utils/main_app_bar/main_app_bar.dart';
import 'package:social_media_app/utils/no_data_page/no_data_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: HomeService.getHomeData(),
          builder: (context, AsyncSnapshot<HomeDataModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingScreen();
            } else if (snapshot.hasData) {
              return Padding(
                padding: EdgeInsets.all(appSizeConstants.padding_16.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoriesView(
                      categories: snapshot.data!.categories,
                    ),
                    SizedBox(
                      height: appSizeConstants.radius_24.h,
                    ),
                    PostsView(
                      posts: snapshot.data!.posts,
                    )
                  ],
                ),
              );
            } else {
              return const NoDataPage();
            }
          },
        ),
      ),
      floatingActionButton: AddPostButton(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddPostView(),
              ));
        },
      ),
    );
  }
}
