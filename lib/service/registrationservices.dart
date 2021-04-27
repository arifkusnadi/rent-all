import 'package:rent/models/constanta.dart';
import 'package:rent/service/apiresponse.dart';
import 'package:rent/service/baseapiservices.dart';

class UserRegistrationServices {
  static String endpoint = Constanta.baseApiUrl + "/registration/insert.php";

  static Future<ApiResponse> sentRequestInsertDataUser(
      dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }
}
