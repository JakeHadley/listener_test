class User {
  User({
    required this.uid,
    required this.displayName,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] as String,
      displayName: map['displayName'] as String,
    );
  }

  // factory User.fromJson(String source) =>
  //     User.fromMap(json.decode(source) as Map<String, dynamic>);

  User.empty({
    this.uid = '',
    this.displayName = '',
  });

  bool isEmpty() => uid.isEmpty;
  bool isNotEmpty() => uid.isNotEmpty;

  final String uid;
  final String displayName;

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'displayName': displayName,
    };
  }

  User copyWith({
    String? uid,
    String? displayName,
  }) {
    return User(
      uid: uid ?? this.uid,
      displayName: displayName ?? this.displayName,
    );
  }

  // String toJson() => json.encode(toMap());
}
