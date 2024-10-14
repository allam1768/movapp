class Taskmodel {
  int? id;
  String title;
  String posterPath;
  String imdb;

  Taskmodel({
    this.id,
    required this.title,
    required this.posterPath,
    required this.imdb,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'posterPath': posterPath,
      'imdb': imdb,
    };
  }

  factory Taskmodel.fromMap(Map<String, dynamic> map) {
    return Taskmodel(
      id: map['id'],
      title: map['title'],
      posterPath: map['posterPath'],
      imdb: map['imdb'],
    );
  }
}
