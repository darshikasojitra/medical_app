import 'package:form_field_validator/form_field_validator.dart';

class Validator {
  static MultiValidator emailValidator = MultiValidator([
    RequiredValidator(errorText: 'enter Email'),
    PatternValidator(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
        errorText: 'please enter valid email')
  ]);

  static MultiValidator passValidator = MultiValidator([
    RequiredValidator(errorText: 'enter password'),
    MinLengthValidator(6, errorText: 'enter valid password'),
    // PatternValidator(
    //     "r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}",
    //     errorText: "please enter vaild password")
  ]);
  static final nameValidator = MultiValidator([
    RequiredValidator(errorText: 'enter username'),
  ]);
  static final phnNoValidator = MultiValidator([
    RequiredValidator(errorText: 'enter phone number'),
    MinLengthValidator(10, errorText: 'enter valid phone number'),
  ]);
}