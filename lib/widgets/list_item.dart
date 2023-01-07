import 'package:flutter/material.dart';
import 'package:github_repos/api/api_manager.dart';
import 'package:github_repos/model/commit.dart';
import 'package:github_repos/model/repository.dart';
import 'package:github_repos/resources/constants.dart';
import 'package:github_repos/widgets/commit_header.dart';
import 'package:github_repos/widgets/repo_info.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.repo}) : super(key: key);
  final Repository repo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Column(
        children: [
          Container(
            color: AppColors.primary2,
            // height: 70,
            child: FutureBuilder(
              future: getCommits(repo.commitsURL),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return showError(snapshot);
                  } else if (snapshot.hasData) {
                    final Commit lastCommit = snapshot.data[0];
                    return CommitHeader(
                      lastCommit: lastCommit,
                      totalCommit: snapshot.data.length,
                    );
                  }
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
          RepositoryInfo(repo: repo),
        ],
      ),
    );
  }
}
