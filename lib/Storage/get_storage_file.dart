import 'package:get_storage/get_storage.dart';
import 'package:nomo_app/Models/user_response_model.dart';

class UserPreferences {
  static final GetStorage _box = GetStorage();

  static const String userModelKey = "userModel";
  static const String userEmailKey = "userEmail";
  static const String hasLoggedInKey = "hasLoggedIn";

  static Future<void> saveUserModel(UserModel userModel) async {
    await _box.write(userModelKey, userModel.toMap());
  }

  static Future<void> saveHasLoggedIn(bool hasLoggedIn) async {
    await _box.write(hasLoggedInKey, hasLoggedIn);
  }

  static bool? getHasLoggedIn() {
    if (_box.read(hasLoggedInKey) != null) {
      final bool hasLoggedIn = _box.read(hasLoggedInKey);
      return hasLoggedIn;
    } else {
      return false;
    }
  }

  static Future<void> saveUserEmail(String email) async {
    await _box.write(userEmailKey, email);
  }

  static UserModel? getUserModel() {
    final Map<String, dynamic>? userModelMap = _box.read(userModelKey);
    if (userModelMap != null) {
      return UserModel.fromMap(userModelMap);
    }
    return null;
  }

  static String getUserEmail() {
    final String userEmail = _box.read(userEmailKey);
    if (userEmail.isNotEmpty) {
      return userEmail;
    }
    return "";
  }

  static void clearUserPreferences() async {
    await _box.remove(userModelKey);
    await _box.remove(userEmailKey);
    await _box.remove(hasLoggedInKey);
  }
}

class GlobalPref {
  static final GetStorage _box = GetStorage();
  static const String sawIntroScreenKey = "sawIntroScreen";

  static Future<void> saveHasSawIntroScreen(bool saw) async {
    await _box.write(sawIntroScreenKey, saw);
  }

  static bool? getHasSawIntroScreen() {
    if (_box.read(sawIntroScreenKey) != null) {
      final bool saw = _box.read(sawIntroScreenKey);
      return saw;
    } else {
      return false;
    }
  }
}
