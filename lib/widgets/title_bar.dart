import 'package:flutter/material.dart';
import 'package:github_repos/resources/constants.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      alignment: Alignment.topLeft,
      child: const Text(
        "Github Repos",
        style: TextStyle(
          color: AppColors.titleColor,
          fontSize: 32,
        ),
      ),
    );
  }
}
