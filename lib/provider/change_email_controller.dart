

import 'package:firebase_auth/firebase_auth.dart';

class EmailChangeService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> changeEmail(String newEmail) async {
    try {
      User? user = _auth.currentUser;
      await user!.updateEmail(newEmail);
      await sendEmailVerification();
      print('Email updated successfully to $newEmail. Verification email sent.');
    } catch (error) {
      print('Error updating email: $error');
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      User? user = _auth.currentUser;
      await user!.sendEmailVerification();
      print('Email verification sent to ${user.email}');
    } catch (error) {
      print('Error sending email verification: $error');
    }
  }

  Future<void> checkEmailVerification() async {
    try {
      User? user = _auth.currentUser;
      await user!.reload();
      user = _auth.currentUser; // Refresh the user data

      if (user!.emailVerified) {
        print('Email is verified');
      } else {
        print('Email is not verified');
      }
    } catch (error) {
      print('Error checking email verification: $error');
    }
  }
}

void main() async {
  EmailChangeService emailChangeService = EmailChangeService();

  // Example: Change email and handle verification
  try {
    await emailChangeService.changeEmail('new_email@example.com');
    await emailChangeService.checkEmailVerification();
  } catch (error) {
    print('Error: $error');
  }
}