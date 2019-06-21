import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FireBaseTasks {
  String smsCode;
  String verificationId;


  //Try to verify the phone number
  Future<void> verifyPhone(String phoneNo) async {
    print('Phone -> $phoneNo');
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 30),
        verificationCompleted: (AuthCredential credentials){
          print("User Authenticated->"+credentials.toString());
        },
        verificationFailed:  (AuthException exception) {
          print('Verification Error -> ${exception.message}');
        },
        codeSent: (String verId, [int forceCodeResend]) {
          this.verificationId = verId;
        },
        codeAutoRetrievalTimeout: (String verId) {
          this.verificationId = verId;
        });
  }

  //Do signin with verification iD and smsCode
  Future<FirebaseUser> signInWithPhoneNumber(String code) async {
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: verificationId,
      smsCode: code,
    );
    final FirebaseUser user = await FirebaseAuth.instance.signInWithCredential(credential);
    final FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
    assert(user.uid == currentUser.uid);
    return user;
  }
}
