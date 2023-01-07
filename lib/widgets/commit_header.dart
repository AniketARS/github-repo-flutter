import 'package:flutter/material.dart';
import 'package:github_repos/model/commit.dart';
import 'package:github_repos/resources/constants.dart';
import 'package:github_repos/widgets/property.dart';

class CommitHeader extends StatelessWidget {
  const CommitHeader({
    Key? key,
    required this.lastCommit,
    required this.totalCommit,
  }) : super(key: key);

  final Commit lastCommit;
  final int totalCommit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Row(
              children: [
                lastCommit.author.avatarUrl.isNotEmpty
                    ? Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                            image: NetworkImage(lastCommit.author.avatarUrl),
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                    : SizedBox(),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lastCommit.author.name,
                        style: const TextStyle(
                          color: AppColors.titleColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        lastCommit.message,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.highlight,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          PropertyWidget(
            property: 'Commits',
            value: totalCommit,
            fontSize: 18,
          ),
        ],
      ),
    );
  }
}
