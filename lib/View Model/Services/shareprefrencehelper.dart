import 'package:shared_preferences/shared_preferences.dart';

class Sharedpreferencehelper {
  //SETTING VARIABLES

  Future<bool> setLaravelAuthToken(String laraveltoken) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString(UserPref.laravelAuthToken.toString(), laraveltoken);
  }

  Future<String?> getLaravelAuthToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(UserPref.laravelAuthToken.toString());
  }

  Future<void> clearTokens() async {
    final pref = await SharedPreferences.getInstance();

    await pref.remove(UserPref.laravelAuthToken.toString());
    await pref.remove(UserPref.firstName.toString());
    await pref.remove(UserPref.lastName.toString());
  }
}

enum UserPref {
  laravelAuthToken,
  firstName,
  lastName,
}

class SPService {
  static late SharedPreferences instance;

  static Future<void> init() async {
    instance = await SharedPreferences.getInstance();
  }

  static void clear() {
    instance.clear();
  }
}
