import 'package:flutter/material.dart';
import 'package:github_repos/model/repository.dart';
import 'package:github_repos/resources/constants.dart';
import 'package:github_repos/widgets/property.dart';
import 'package:github_repos/widgets/repo_date.dart';

class RepositoryInfo extends StatelessWidget {
  const RepositoryInfo({
    Key? key,
    required this.repo,
  }) : super(key: key);

  final Repository repo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: AppColors.primary1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  repo.name,
                  style: const TextStyle(
                    color: AppColors.titleColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  repo.description,
                  style: const TextStyle(
                    color: AppColors.highlight,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 2,
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  color: AppColors.highlight,
                ),
                RepoDate(repo: repo),
              ],
            ),
          ),
          PropertyWidget(
            value: repo.forksCount,
            property: "Forks",
            fontSize: 24,
          ),
        ],
      ),
    );
  }
}
