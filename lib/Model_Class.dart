

class Item {
  final int id;
  final String title;
  final String subtitle;

  Item({required this.id, required this.title, required this.subtitle});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
    );
  }
}
