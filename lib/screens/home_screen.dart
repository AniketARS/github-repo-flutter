import 'package:flutter/material.dart';
import 'package:github_repos/api/api_manager.dart';
import 'package:github_repos/resources/constants.dart';
import 'package:github_repos/widgets/list_item.dart';
import 'package:github_repos/widgets/title_bar.dart';

import '../model/repository.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            const TitleBar(),
            Expanded(
              child: FutureBuilder(
                future: getRepos(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return showError(snapshot);
                    } else if (snapshot.hasData) {
                      final repos = snapshot.data;
                      return ListView.builder(
                        itemCount: repos.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          final Repository repo = repos[index];
                          return ListItem(repo: repo);
                        },
                      );
                    }
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
