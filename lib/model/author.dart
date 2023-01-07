class Author {
  final String name;
  final String avatarUrl;

  Author({
    required this.name,
    required this.avatarUrl,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      name: json['name'] ?? json['login'] ?? "",
      avatarUrl: json['avatar_url'] ?? "",
    );
  }
}
