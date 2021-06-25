class MovieWithDetails {
  final String? title;
  final String? poster;
  final String? year;

  final String? runtime;
  final String? genre;
  final String? director;
  final String? actors;
  final String? plot;

  //actors alanı muhtemelen liste olarak dönecek, onun düzenlenmesi gerekebilir!
  MovieWithDetails(
      {required this.title,
      required this.poster,
      required this.year,
      required this.runtime,
      required this.genre,
      required this.director,
      required this.actors,
      required this.plot});

  String getTitle() {
    return title!;
  }

  String getYear() {
    return year!;
  }

  String getPoster() {
    return poster!;
  }

  String getRuntime() {
    return runtime!;
  }

  String getGenre() {
    return genre!;
  }

  String getDirector() {
    return director!;
  }

  String getActors() {
    return actors!;
  }

  String getPlot() {
    return plot!;
  }

  factory MovieWithDetails.fromJson(Map<String, dynamic> json) {
    return MovieWithDetails(
        title: json['Title'],
        poster: json['Poster'],
        year: json['Year'],
        runtime: json['Runtime'],
        genre: json['Genre'],
        director: json['Director'],
        actors: json['Actors'],
        plot: json['Plot']);
  }
}
