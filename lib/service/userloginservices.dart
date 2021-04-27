import 'package:rent/models/constanta.dart';
import 'package:rent/service/apiresponse.dart';
import 'package:rent/service/baseapiservices.dart';

class UserLoginServices {
  static String endpoint = Constanta.baseApiUrl + "/auth.php";
  static Future<ApiResponse> authentication(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }
}
