import 'package:form_field_validator/form_field_validator.dart';
import 'package:medical_app/resources/resources.dart';

class Validator {
  static MultiValidator emailValidator = MultiValidator([
    RequiredValidator(errorText: StringManager.pleaseenteremail),
    PatternValidator(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
        errorText: StringManager.pleaseentervalidemail)
  ]);

  static MultiValidator passValidator = MultiValidator([
    RequiredValidator(errorText: StringManager.pleaseenterpassword),
    MinLengthValidator(6, errorText: StringManager.pleaseentervalidpassword),
    // PatternValidator(
    //     "r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}",
    //     errorText: "please enter vaild password")
  ]);
  static final nameValidator = MultiValidator([
    RequiredValidator(errorText: StringManager.pleaseenterusername),
  ]);
  static final phnNoValidator = MultiValidator([
    RequiredValidator(errorText: StringManager.enterphnno),
    MinLengthValidator(10, errorText: StringManager.pleaseentervalidphnno),
  ]);
}