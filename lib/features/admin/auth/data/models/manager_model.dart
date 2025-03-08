class ManagerModel {
  final String email;
  final String? firstName;
  final String? lastName;
  final String password;
  String? id;

  ManagerModel({
    required this.email,
    this.firstName,
    this.lastName,
    required this.password,
    this.id,
  });

  // factory ManagerModel.fromJson(Map<String, dynamic> json) => ManagerModel(
  //     email: json['email'],
  //     firstName: json['firstName'],
  //     lastName: json['lastName'],
  //     password: json['']);
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      "firstName": firstName,
      "lastName": lastName,
      "password": password,
    };
  }
}
