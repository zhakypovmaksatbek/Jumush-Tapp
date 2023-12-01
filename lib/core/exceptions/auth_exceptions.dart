import 'package:easy_localization/easy_localization.dart';
import 'package:jumush_tapp/generated/locale_keys.g.dart';

class AuthExceptions {
  static String showErrorMessage(String exceptionCode) {
    switch (exceptionCode) {
      case 'INVALID_LOGIN_CREDENTIALS':
        return LocaleKeys.exceptions_invalid_login_credential.tr();
      case 'email-already-in-use':
        return LocaleKeys.exceptions_email_already_in_use.tr();
      default:
        return LocaleKeys.exceptions_exceptions.tr();
    }
  }
}
