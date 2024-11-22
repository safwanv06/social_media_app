import 'package:dio/dio.dart';
import 'package:social_media_app/main.dart';
import 'package:social_media_app/utils/middleware/dio_api_handler/dio_api_handler.dart';
import 'package:social_media_app/utils/middleware/shared_data_handler/shared_data_key.dart';

class SignInService {
  static Future sentOtp({required String mobileNumber}) async {
    try {
      Response response = await dioApiCall().post(apiRoutes.signIn,
          data: {"country_code": "+91", "phone": mobileNumber});
      if (response.statusCode == 202) {
        await sharedDataHandler.setSharedData(
            key: SharedDataKey.token, value: response.data["token"]["access"]);
        return true;
      } else {
        throw Error();
      }
    } catch (e) {
      rethrow;
    }
  }
}
