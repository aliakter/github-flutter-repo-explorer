import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import '../../data/models/repo_model.dart';

class RepoDetailsPage extends StatelessWidget {
  const RepoDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RepoModel repo = Get.arguments;


    return Scaffold(
      appBar: AppBar(title: Text(repo.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(backgroundImage: NetworkImage(repo.avatar)),
            const SizedBox(height: 12),
            Text(repo.owner, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 12),
            Text(repo.description),
            const SizedBox(height: 12),
            Text('⭐ Stars: ${repo.stars}'),
            Text(
              'Updated: ${DateFormat('MM-dd-yyyy HH:mm').format(repo.updatedAt)}',
            ),
          ],
        ),
      ),
    );
  }
}