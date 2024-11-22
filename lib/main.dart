import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/screens/home/controller/video_player_provider.dart';
import 'package:social_media_app/utils/api_routes/api_routes.dart';
import 'package:social_media_app/utils/image_data/image_data.dart';
import 'package:social_media_app/utils/middleware/shared_data_handler/shared_data_handler.dart';
import 'package:social_media_app/utils/size_constants/app_size_constants.dart';
import 'package:social_media_app/utils/theme/app_colors/app_colors.dart';
import 'package:social_media_app/utils/theme/font_styles/font_styles.dart';

import 'screens/add_post_screen/controller/add_feed_controller.dart';
import 'screens/authentication/view/sign_in_view.dart';

AppSizeConstants appSizeConstants = AppSizeConstants();
ScreenUtil screenUtil = ScreenUtil();
SharedDataHandler sharedDataHandler = SharedDataHandler();
ApiRoutes apiRoutes = ApiRoutes();
ImageData imageData = ImageData();
AppColors appColors = AppColors();
FontStyles fontStyles = FontStyles();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => VideoPlayerProvider()),
        ChangeNotifierProvider(
          create: (context) => AddFeedProvider(),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(393, 899),
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: appColors.primaryBlack,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: SignInView(),
        ),
      ),
    );
  }
}
