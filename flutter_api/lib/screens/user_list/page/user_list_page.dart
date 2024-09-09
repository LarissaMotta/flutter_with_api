import 'package:flutter/material.dart';
import 'package:flutter_api/api/user_api.dart';
import 'package:flutter_api/models/user.dart';
import 'package:flutter_api/screens/user_list/widget/user_list_item.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  late Future<List<User>> usersFuture;
  final UserApi _userApi = UserApi();

  @override
  void initState() {
    super.initState();
    usersFuture = _userApi.getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Listagem de usuários'),
        ),
        body: ItemList(usersFuture: usersFuture),
      ),
    );
  }
}
