import 'package:flutter/material.dart';
import 'package:github_repos/resources/constants.dart';

import '../model/repository.dart';

class RepoDate extends StatelessWidget {
  const RepoDate({
    Key? key,
    required this.repo,
  }) : super(key: key);

  final Repository repo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.date_range,
              color: AppColors.titleColor,
            ),
            const SizedBox(width: 5),
            Text(
              '${months[repo.createdAt.month - 1]} ${repo.createdAt.day}, ${repo.createdAt.year}',
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.titleColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        const Text(
          "Created Date",
          style: TextStyle(
            color: AppColors.highlight,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
