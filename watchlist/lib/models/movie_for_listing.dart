class MovieForListing {
  final String? title;
  final String? poster;
  final String? year;

  //title type poster year
  MovieForListing(
      {required this.title, required this.poster, required this.year});

  String getTitle() {
    return title!;
  }

  String getPoster() {
    return poster!;
  }

  String getYear() {
    return year!;
  }

  factory MovieForListing.fromJson(Map<String, dynamic> json) {
    return MovieForListing(
        title: json['Title'], poster: json['Poster'], year: json['Year']);
  }
}
