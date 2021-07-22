class ValidationService {
  static bool username(String text) {
    return text.length > 1;
  }

  static bool email(String text) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text);
    return emailValid;
  }

  static bool password(String text) {
    return text.length >= 6;
  }

  static bool confirmPassword(String password, String confirmPassword) {
    return password == confirmPassword;
  }
}
