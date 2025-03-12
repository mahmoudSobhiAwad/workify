import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFailure implements Exception {
  final String message;
  final FirebaseFailureType type;

  FirebaseFailure(this.message, {this.type = FirebaseFailureType.unknown});

  @override
  String toString() => 'FirebaseFailure($type): $message';

  /// Factory method to create failure from FirebaseAuthException.
  factory FirebaseFailure.fromAuthException(FirebaseAuthException error) {
    switch (error.code) {
      case "email-already-in-use":
        return FirebaseFailure("This email is already in use.",
            type: FirebaseFailureType.emailAlreadyInUse);
      case "invalid-email":
        return FirebaseFailure("Invalid email address.",
            type: FirebaseFailureType.invalidEmail);
      case "operation-not-allowed":
        return FirebaseFailure("Email/password authentication is not enabled.",
            type: FirebaseFailureType.operationNotAllowed);
      case "weak-password":
        return FirebaseFailure("The password is too weak.",
            type: FirebaseFailureType.weakPassword);
      case "too-many-requests":
        return FirebaseFailure("Too many requests. Please try again later.",
            type: FirebaseFailureType.tooManyRequests);
      case "user-token-expired":
        return FirebaseFailure(
            "User session has expired. Please sign in again.",
            type: FirebaseFailureType.tokenExpired);
      case "network-request-failed":
        return FirebaseFailure(
            "Network error. Please check your internet connection.",
            type: FirebaseFailureType.networkError);
      default:
        return FirebaseFailure(error.message ?? "Unknown authentication error.",
            type: FirebaseFailureType.unknown);
    }
  }
}

/// Enum for different Firebase authentication failure types
enum FirebaseFailureType {
  emailAlreadyInUse,
  invalidEmail,
  operationNotAllowed,
  weakPassword,
  tooManyRequests,
  tokenExpired,
  networkError,
  unknown,
}
