class EmployeeModel {
  final String userName;
  final String password;
  final String firstName;
  final String lastName;
  final String? address;
  final String? email;
  final String? phone;
  final String jobTitle;
  final String jobLevel;
  final int? numOfHolidays;
  final double salary;

  EmployeeModel({
    required this.userName,
    required this.password,
    required this.firstName,
    required this.lastName,
    this.address,
    this.email,
    this.phone,
    required this.jobTitle,
    required this.jobLevel,
    this.numOfHolidays=0,
    required this.salary,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      userName: json['userName'],
      password: json['password'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      address: json['address'],
      email: json['email'],
      phone: json['phone'],
      jobTitle: json['jobTitle'],
      jobLevel: json['jobLevel'],
      numOfHolidays: json['numOfHolidays'] ?? 0,
      salary: (json['salary'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'address': address,
      'email': email,
      'phone': phone,
      'jobTitle': jobTitle,
      'jobLevel': jobLevel,
      'numOfHolidays': numOfHolidays,
      'salary': salary,
    };
  }
}
