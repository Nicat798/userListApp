import 'package:flutter/material.dart';
import 'package:user_list_app/constants/strings.dart';
import 'package:user_list_app/view/users_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ProjectStrings.projectName,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(ProjectStrings.projectName),
        ),
        body: const UsersPage(),
      ),
    );
  }
}
