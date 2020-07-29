import 'package:http/http.dart' as http;

class dataController
{
  static Future<http.Response> getDashboardData () async
  {
    return http.get(Uri.encodeFull("https://ds-ecom.azurewebsites.net/products"));
  }

  static Future<http.Response> getJsonData (strUrl) async
  {
    return http.get(Uri.encodeFull(strUrl));
  }
}
