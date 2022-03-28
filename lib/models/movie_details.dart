class MovieDetails {
  String id;
  String title;
  String year;
  List<String> genres;
  List<int> ratings;
  String poster;
  String contentRating;
  String duration;
  String releaseDate;
  int averageRating;
  String originalTitle;
  String storyline;
  List<String> actors;
  var imdbRating;
  String posterurl;

  MovieDetails(
      {required this.id,
      required this.title,
      required this.year,
      required this.genres,
      required this.ratings,
      required this.poster,
      required this.contentRating,
      required this.duration,
      required this.releaseDate,
      required this.averageRating,
      required this.originalTitle,
      required this.storyline,
      required this.actors,
      required this.imdbRating,
      required this.posterurl});

  factory MovieDetails.fromJson(Map<String, dynamic> json) => MovieDetails(
      id: json['id'],
      title: json['title'],
      year: json['year'],
      genres: json['genres'].cast<String>(),
      ratings: json['ratings'].cast<int>(),
      poster: json['poster'],
      contentRating: json['contentRating'],
      duration: json['duration'],
      releaseDate: json['releaseDate'],
      averageRating: json['averageRating'],
      originalTitle: json['originalTitle'],
      storyline: json['storyline'],
      actors: json['actors'].cast<String>(),
      imdbRating: json['imdbRating'],
      posterurl: json['posterurl']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['year'] = year;
    data['genres'] = genres;
    data['ratings'] = ratings;
    data['poster'] = poster;
    data['contentRating'] = contentRating;
    data['duration'] = duration;
    data['releaseDate'] = releaseDate;
    data['averageRating'] = averageRating;
    data['originalTitle'] = originalTitle;
    data['storyline'] = storyline;
    data['actors'] = actors;
    data['imdbRating'] = imdbRating;
    data['posterurl'] = posterurl;
    return data;
  }

  @override
  String toString() {
    return 'MovieDetails{id: $id, title: $title, year: $year, genres: $genres, ratings: $ratings, poster: $poster, contentRating: $contentRating, duration: $duration, releaseDate: $releaseDate, averageRating: $averageRating, originalTitle: $originalTitle, storyline: $storyline, actors: $actors, imdbRating: $imdbRating, posterurl: $posterurl}';
  }
}
