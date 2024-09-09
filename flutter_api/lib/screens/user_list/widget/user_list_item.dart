import 'package:flutter/material.dart';
import 'package:flutter_api/models/user.dart';
import 'package:flutter_api/screens/user_form/page/user_form_page.dart';

class ItemList extends StatelessWidget {
  final Future<List<User>> usersFuture;

  const ItemList({super.key, required this.usersFuture});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: usersFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<User> users = snapshot.data as List<User>;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final item = users[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(item.avatar),
                  radius: 50, // Define o tamanho da imagem circular
                ),
                title: Text('${item.firstName} ${item.lastName}'),
                subtitle: Text(item.email),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => UserFormPage(id: item.id),
                    ),
                  );
                },
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}
