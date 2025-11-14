class AppUser {
  final String uid;
  final String email;
  final String? displayName;

  AppUser({required this.uid, required this.email, this.displayName});

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      uid: json['uid'],
      email: json['email'],
      displayName: json['displayName'],
    );
  }

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'email': email,
    'displayName': displayName,
  };
}
