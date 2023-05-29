import 'package:shared_preferences/shared_preferences.dart';
import 'package:medical_app/user_preferences/global_preferences.dart';

const String selectedLocaleLanguageCodePref = "selectLocaleLanguageCodePref";
const String totalstring = "total";
class UserPreferences{
static Future<void> setLocaleLanguageCode(
      {required String languageCode}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(selectedLocaleLanguageCodePref, languageCode);
    GlobalVariables.languageCode = languageCode;
  }
     static Future<String> getLocaleLanguageCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(selectedLocaleLanguageCodePref) ??
        LanguageCode.languageCodeEnglish;
  }  
}