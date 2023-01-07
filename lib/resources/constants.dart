import 'package:flutter/material.dart';

const List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

class AppColors {
  static const Color bg = Color(0xff404258);
  static const Color primary1 = Color(0xff474e68);
  static const Color primary2 = Color(0xff50577a);
  static const Color highlight = Color(0xff969cb3);
  static const Color titleColor = Color(0xffece9e9);
}

const String baseUrl = 'https://api.github.com/users/freeCodeCamp/repos';

Widget showError(AsyncSnapshot<dynamic> snapshot) {
  return Center(
    child: Text('${snapshot.error}'),
  );
}
