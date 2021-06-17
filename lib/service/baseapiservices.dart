import 'package:rent/service/apiresponse.dart';
import 'package:http/http.dart' as http;

class BaseApiService {
  static Future<ApiResponse> sendPostRequest(
      String url, String authToken, var requestBody) async {
    print(url);
    print(requestBody.toString());
    final response = await http.post(Uri.parse(url),
        body: requestBody, headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return apiResponseFromJson(responseString);
    } else {
      return null;
    }
  }
}
