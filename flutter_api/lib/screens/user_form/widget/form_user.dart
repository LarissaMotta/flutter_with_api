import 'package:flutter/material.dart';
import 'package:flutter_api/models/user.dart';

class FormUser extends StatefulWidget {
  late Future<User> userFuture;
  FormUser({super.key, required this.userFuture});

  @override
  State<FormUser> createState() => _FormUserState();
}

class _FormUserState extends State<FormUser> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      future: widget.userFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final User user = snapshot.data as User;
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(user.avatar),
                  radius: 50, // Define o tamanho da imagem circular
                ),
                TextFormField(
                  initialValue: user.firstName,
                  decoration: const InputDecoration(
                    // hintText: "HintText",
                    labelText: "Primeiro Nome*",
                  ),
                  enabled: false,
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                ),
                TextFormField(
                  initialValue: user.lastName,
                  decoration: const InputDecoration(
                    // hintText: "HintText",
                    labelText: "Último Nome*",
                  ),
                  enabled: false,
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                ),
                TextFormField(
                  initialValue: user.email,
                  decoration: const InputDecoration(
                    // hintText: "HintText",
                    labelText: "Email*",
                  ),
                  enabled: false,
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                  validator: (String? value) {
                    return (value != null && value.contains('@'))
                        ? 'Do not use the @ char.'
                        : null;
                  },
                ),
              ],
            ),
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
