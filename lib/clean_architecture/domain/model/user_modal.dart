class People {
  final String name;
  final String username;
  final String image;
  People({
    required this.name,
    required this.username,
    required this.image,
  });

  factory People.empty() => People(
      name: '',
      username: '',
      image:
          'https://firebasestorage.googleapis.com/v0/b/prueba-api-7bcb0.appspot.com/o/users%2Fuser.png?alt=media&token=07fb8586-db1d-47c5-aee0-0a2fe636e2f5');
}
