import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/screens/authentication/service/service.dart';
import 'package:social_media_app/utils/custom_button/custom_button.dart';
import 'package:social_media_app/utils/custom_flushbar/custom_flushbar.dart';
import 'package:social_media_app/utils/loading_screen/loading_screen.dart';
import 'package:social_media_app/utils/middleware/api_error_handling/api_error_handling.dart';

import '../../../main.dart';
import '../../../utils/custom_textfield/custom_textfield.dart';
import '../../home/view/home_view.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});

  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(appSizeConstants.padding_16.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: appSizeConstants.padding_80.h,
              ),
              Text(
                "Enter Your \nMobile Number",
                style: fontStyles.text_24_500_White,
              ),
              SizedBox(
                height: appSizeConstants.padding_12.h,
              ),
              Text(
                "Lorem ipsum dolor sit amet consectetur. Porta at id hac vitae. Et tortor at vehicula euismod mi viverra.",
                style: fontStyles.text_12_400_E2E2E2,
              ),
              SizedBox(
                height: appSizeConstants.padding_32.h,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: CustomTextField(
                        isEnabled: false,
                        onChanged: (value) {},
                        suffixWidget: Image.asset(imageData.arrowDown),
                        controller: TextEditingController(text: "+91"),
                      )),
                  SizedBox(
                    width: appSizeConstants.padding_16,
                  ),
                  Expanded(
                      flex: 6,
                      child: CustomTextField(
                        maxLength: 10,
                        hintText: "Enter mobile number",
                        controller: numberController,
                        onChanged: (value) {},
                        keyboard: TextInputType.phone,
                      )),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    buttonName: "Continue",
                    suffix: Image.asset(imageData.arrowRed),
                    onTap: () {
                      if (numberController.text.length == 10) {
                        loadingScreen(context);
                        SignInService.sentOtp(
                                mobileNumber: numberController.text)
                            .then(
                          (value) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeView(),
                                ));
                          },
                        ).onError(
                          (error, stackTrace) {
                            Navigator.pop(context);
                            apiErrorHandling(context: context, error: error);
                          },
                        );
                      } else {
                        flushBarNotification(
                            context: context,
                            message: "Enter valid number",
                            type: FlushBarType.error);
                      }
                    },
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
