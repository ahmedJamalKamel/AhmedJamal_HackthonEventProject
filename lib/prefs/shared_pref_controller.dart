
import 'package:hakathon_redy/Model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys { loggedIn, name, mobile, gender, token }

class SharedPrefController {
  static final SharedPrefController _instance = SharedPrefController._();

  SharedPrefController._();

  late SharedPreferences _sharedPreferences;

  factory SharedPrefController() {
    return _instance;
  }

  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> save({required User student}) async {
    await _sharedPreferences.setBool(PrefKeys.loggedIn.toString(), true);
    await _sharedPreferences.setString(
        PrefKeys.name.toString(), student.name);
    await _sharedPreferences.setString(
        PrefKeys.mobile.toString(), student.mobile);
    await _sharedPreferences.setString(
        PrefKeys.gender.toString(), student.gender);
    await _sharedPreferences.setString(
        PrefKeys.token.toString(), 'Bearer ' + student.token);
  }

  bool get loggedIn =>
      _sharedPreferences.getBool(PrefKeys.loggedIn.toString()) ?? false;

  String get token =>
      _sharedPreferences.getString(PrefKeys.token.toString()) ?? '';

  Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }
}
