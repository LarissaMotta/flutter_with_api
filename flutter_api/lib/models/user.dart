class User {
  final int id;
  final String email;
  final String firstName; //first_name
  final String lastName; //last_name
  final String avatar;

  const User({required this.id, 
              required this.email,
              required this.firstName,
              required this.lastName,
              required this.avatar});
  
  factory User.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'email': String email,
        'first_name': String firstName,
        'last_name': String lastName,
        'avatar': String avatar,
      } =>
        User(
          id: id,
          email: email,
          firstName: firstName,
          lastName: lastName,
          avatar: avatar
        ),
      _ => throw const FormatException('Failed to load user.'),
    };
  }

}