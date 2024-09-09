import 'package:flutter/material.dart';
import 'package:flutter_api/api/user_api.dart';
import 'package:flutter_api/models/user.dart';
import 'package:flutter_api/screens/user_form/widget/form_user.dart';

class UserFormPage extends StatefulWidget {
  final int id;
  const UserFormPage({super.key, required this.id});

  @override
  State<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  late Future<User> userFuture;
  final UserApi _userApi = UserApi();

  @override
  void initState() {
    super.initState();
    userFuture = _userApi.getUser(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Usuário'),
        ),
        body: FormUser(userFuture: userFuture),
      ),
    );
  }
}
