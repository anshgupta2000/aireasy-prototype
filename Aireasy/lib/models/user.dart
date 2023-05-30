class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String gender;
  final DateTime birthday;
  final String hometown;
  final String aboutMe;
  final String profession;
  final String interests;
  final String role; // "passenger" or "flight attendant"
  final String? flightReference; // This can be null for flight attendants
  final String?
      profilePicture; // This can be null if the user hasn't added a profile picture

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.birthday,
    required this.hometown,
    required this.aboutMe,
    required this.profession,
    required this.interests,
    required this.role,
    this.flightReference,
    this.profilePicture,
  });

  // Method to convert a User object into a map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'birthday': birthday.toIso8601String(),
      'hometown': hometown,
      'aboutMe': aboutMe,
      'profession': profession,
      'interests': interests,
      'role': role,
      'flightReference': flightReference,
      'profilePicture': profilePicture,
    };
  }

  // Method to convert a map object into a User object
  static User fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      gender: map['gender'],
      birthday: DateTime.parse(map['birthday']),
      hometown: map['hometown'],
      aboutMe: map['aboutMe'],
      profession: map['profession'],
      interests: map['interests'],
      role: map['role'],
      flightReference: map['flightReference'],
      profilePicture: map['profilePicture'],
    );
  }
}
