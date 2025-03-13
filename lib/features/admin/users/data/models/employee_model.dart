import 'package:workify/features/employee/finger_print/data/models/movement_model.dart';

class UserMovements {
  final Map<String, MovementModel> movements;

  UserMovements({required this.movements});

  // Convert Firestore Document to Dart Object
  factory UserMovements.fromMap(Map<String, dynamic> map) {
    Map<String, MovementModel> parsedMovements = {};
    map.forEach((date, movementData) {
      parsedMovements[date] =
          MovementModel.fromJson(movementData as Map<String, dynamic>);
    });
    return UserMovements(movements: parsedMovements);
  }

  // Convert Dart Object to Firestore Document
  Map<String, dynamic> toMap() {
    Map<String, dynamic> result = {};
    movements.forEach((date, movement) {
      result[date] = movement.toMap();
    });
    return result;
  }
}

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
  final UserMovements?
      movements; // Fixed: Now correctly represents movements as a map.

  EmployeeModel({
    required this.userName,
    required this.password,
    required this.firstName,
    required this.lastName,
    this.movements,
    this.address,
    this.email,
    this.phone,
    required this.jobTitle,
    required this.jobLevel,
    this.numOfHolidays = 0,
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
      movements: json['movements'] != null
          ? UserMovements.fromMap(json['movements'] as Map<String, dynamic>)
          : null,
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
      'movements': movements?.toMap(),
    };
  }
}
