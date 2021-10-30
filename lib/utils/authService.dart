import 'package:shared_preferences/shared_preferences.dart';

storeUserData(apiResponse) async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  await storage.setString('token', apiResponse['access_token']);
  // await storage.setString('name', apiResponse['user']['name']);
}

Future<String?> getToken() async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  String? token = storage.getString('token');
  return token;
}

const apiUrl = 'http://149.28.203.142';
