import 'dart:convert';

import 'package:github_repos/model/commit.dart';
import 'package:github_repos/model/repository.dart';
import 'package:http/http.dart' as http;

import '../resources/constants.dart';

final headers = {'Authorization': 'Bearer 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'};

Future<List<Repository>> getRepos() async {
  final response = await http.get(Uri.parse(baseUrl), headers: headers);

  if (response.statusCode == 200) {
    final body = jsonDecode(response.body);
    final repoList = body.map((e) => Repository.fromJson(e)).toList();
    return List<Repository>.from(repoList);
  } else {
    print(response.statusCode);
    throw Exception('getRepos: Unexpected error occurred!');
  }
}

Future<List<Commit>> getCommits(String url) async {
  final response = await http.get(Uri.parse(url), headers: headers);

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    final commitsList = json.map((e) => Commit.fromJson(e)).toList();
    return List<Commit>.from(commitsList);
  } else {
    throw Exception('getCommits: Unexpected error occurred!');
  }
}
