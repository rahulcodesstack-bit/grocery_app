import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String email;
  final String phoneNumber;
  final String firstName;
  final String lastName;
  final String profilePicture;
  final bool isProfileCompleted;
  final bool isPhoneVerified;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserModel({
    required this.id,
    required this.email,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.profilePicture,
    required this.isProfileCompleted,
    this.isPhoneVerified = false,
    this.createdAt,
    this.updatedAt,
  });

  // ================================
  // Empty User (Initial State)
  // ================================
  static UserModel empty() => UserModel(
    id: '',
    email: '',
    phoneNumber: '',
    firstName: '',
    lastName: '',
    profilePicture: '',
    isProfileCompleted: false,
    isPhoneVerified: false,
  );

  // ================================
  // Firestore → Model
  // ================================
  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return UserModel(
      id: snapshot.id,
      email: data['email'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      profilePicture: data['profilePicture'] ?? '',
      isProfileCompleted: data['isProfileCompleted'] ?? false,
      isPhoneVerified: data['isPhoneVerified'] ?? false,
      createdAt: data['createdAt']?.toDate(),
      updatedAt: data['updatedAt']?.toDate(),
    );
  }

  // ================================
  // Model → Firestore JSON
  // ================================
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phoneNumber': phoneNumber,
      'firstName': firstName,
      'lastName': lastName,
      'profilePicture': profilePicture,
      'isProfileCompleted': isProfileCompleted,
      'isPhoneVerified': isPhoneVerified,
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }

  // ================================
  // Helpers
  // ================================
  String get fullName => '$firstName $lastName';

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? profilePicture,
    bool? isProfileCompleted,
    bool? isPhoneVerified,
  }) {
    return UserModel(
      id: id,
      email: email,
      phoneNumber: phoneNumber,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      profilePicture: profilePicture ?? this.profilePicture,
      isProfileCompleted:
      isProfileCompleted ?? this.isProfileCompleted,
      isPhoneVerified: isPhoneVerified ?? this.isPhoneVerified,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
    );
  }
}
