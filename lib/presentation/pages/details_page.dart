import 'package:flutter/material.dart';
import 'package:github_flutter_repo_explorer/domain/entities/repo_entity.dart';
import 'package:intl/intl.dart';

class DetailsPage extends StatelessWidget {
  final RepoEntity repo;

  const DetailsPage(this.repo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(repo.name)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: NetworkImage(repo.avatar)),
                SizedBox(width: 10),
                Text(repo.owner),
              ],
            ),
            SizedBox(height: 10),
            Text(repo.description),
            SizedBox(height: 10),
            Text(DateFormat('MM-dd-yyyy HH:mm').format(repo.updatedAt)),
          ],
        ),
      ),
    );
  }
}
