class Grosery {
  final int? id;
  final String name;
  Grosery({
    this.id,
    required this.name,
  });

  factory Grosery.fromMap(Map<String, dynamic> json) => Grosery(
        name: json['name'],
        id: json['id'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
