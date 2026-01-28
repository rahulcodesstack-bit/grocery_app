import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../features/authentication/models/user_model.dart';
import '../../../utils/constants/keys.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/popups/full_screen_loader.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  // ================================
  // Firestore Instance
  // ================================
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // ================================
  // Save User Record
  // ================================
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db
          .collection(TKeys.userCollection)
          .doc(user.id)
          .set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw TFormatException(e.message).message;
    } catch (_) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // ================================
  // Update User Profile
  // ================================
  Future<void> updateUserProfile(UserModel user) async {
    try {
      await _db.collection('users').doc(user.id).update(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw TFormatException(e.message).message;
    } catch (_) {
      throw 'Unable to update user profile.';
    }
  }

  // ================================
  // Fetch User Details
  // ================================
  Future<UserModel> fetchUserDetails(String userId) async {
    try {
      final snapshot = await _db.collection('users').doc(userId).get();

      if (!snapshot.exists) {
        throw 'User does not exist.';
      }

      return UserModel.fromSnapshot(snapshot);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw TFormatException(e.message).message;
    } catch (_) {
      throw 'Failed to fetch user details.';
    }
  }

  Future<void> updatePhoneVerification(String userId, bool isVerified) async {
    try {
      await _db.collection('users').doc(userId).update({
        'isPhoneVerified': isVerified,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to update phone verification: $e');
    }
  }
}
