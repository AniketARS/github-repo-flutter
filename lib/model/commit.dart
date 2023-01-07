import 'package:github_repos/model/author.dart';

class Commit {
  final String sha;
  final String message;
  final DateTime createdAt;
  final Author author;

  Commit({
    required this.sha,
    required this.message,
    required this.createdAt,
    required this.author,
  });

  factory Commit.fromJson(Map<String, dynamic> json) {
    final jsonCommit = json['commit'];
    final jsonCommitter = jsonCommit['committer'];
    final jsonAuthor = json['author'] ?? jsonCommit['author'];

    return Commit(
      sha: json['sha'],
      message: jsonCommit['message'],
      createdAt: DateTime.parse(jsonCommitter['date']),
      author: Author.fromJson(jsonAuthor),
    );
  }
}
