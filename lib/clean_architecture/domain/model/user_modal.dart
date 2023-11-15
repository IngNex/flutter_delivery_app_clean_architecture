class People {
  final String name;
  final String username;
  final String image;
  People({
    required this.name,
    required this.username,
    required this.image,
  });

  factory People.empty() =>
      People(name: '', username: '', image: 'assets/delivery/sad.png');
}
