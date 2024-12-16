import 'package:myfriendfaith/utils/validator/email.dart';
import 'package:myfriendfaith/utils/validator/password.dart';

bool signUpValidator(String? email, String? pwd) {
  String? emailError = emailValidator(email);
  String? pwdError = passwordValidator(pwd);
  if (emailError != null || pwdError != null) {
    return false;
  }
  return true;
}
