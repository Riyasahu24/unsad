import 'package:shared_preferences/shared_preferences.dart';

class savemydata {
  static String memekey = "MEMEKEY";

  static Future<bool> savedata(int val) async {
    final inst = await SharedPreferences.getInstance();
    return await inst.setInt(memekey, val);
  }

  static Future<int?> fetchdata() async {
    final inst = await SharedPreferences.getInstance();
    return await inst.getInt(memekey);
  }
}
