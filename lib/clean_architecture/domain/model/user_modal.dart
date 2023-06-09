class User {
  final String name;
  final String username;
  final String image;
  User({
    required this.name,
    required this.username,
    required this.image,
  });

  factory User.empty() =>
      User(name: '', username: '', image: 'assets/delivery/sad.png');
}
