class UserDetails {
  String? uid;
  String? name;
  String? email;
  List<String> watchList;

  UserDetails({
    this.uid,
    this.name,
    this.email,
    this.watchList = const [],
  });

  factory UserDetails.fromJson(Map<dynamic, dynamic> json) => UserDetails(
        uid: json["uid"],
        name: json["name"],
        email: json["email"],
        watchList: List<String>.from(json["watchList"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "email": email,
        "watchList": List<dynamic>.from(watchList.map((x) => x)),
      };
}
