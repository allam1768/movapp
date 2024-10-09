class Moviemodel {
  int? id;
  String judul;
  String posterPath;
  String imdb;
  int isFavorite;

  Moviemodel({
    this.id,
    required this.judul,
    required this.posterPath,
    required this.imdb,
    this.isFavorite = 0, // Default non-favorit
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'judul': judul,
      'posterPath': posterPath,
      'imdb': imdb,
      'isFavorite': isFavorite,
    };
  }

  factory Moviemodel.fromMap(Map<String, dynamic> map) {
    return Moviemodel(
      id: map['id'],
      judul: map['judul'],
      posterPath: map['posterPath'],
      imdb: map['imdb'],
      isFavorite: map['isFavorite'],
    );
  }
}
