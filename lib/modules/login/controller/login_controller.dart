import 'package:get/get.dart';

class LoginController extends GetxController {
  // final FirebaseAuth auth = FirebaseAuth.instance;

  // RxString googlwUserName = ''.obs,
  //     googleUserEmail = ''.obs,
  //     googleUserImg = ''.obs,
  //     googleUserId = ''.obs;

  // Future<void> handleGoogleSignIn() async {
  //   final GoogleSignIn googleSignIn = GoogleSignIn();

  //   try {
  //     final GoogleSignInAccount? googleSignInAccount =
  //         await googleSignIn.signIn();
  //     if (googleSignInAccount != null) {
  //       if (FirebaseAuth.instance.currentUser != null) {
  //         handleGoogleSignOut();
  //       }
  //       final GoogleSignInAuthentication googleSignInAuthentication =
  //           await googleSignInAccount.authentication;

  //       final AuthCredential credential = GoogleAuthProvider.credential(
  //           idToken: googleSignInAuthentication.idToken,
  //           accessToken: googleSignInAuthentication.accessToken);

  //       await auth.signInWithCredential(credential);
  //       User? firebaseUser = FirebaseAuth.instance.currentUser;
  //       if (firebaseUser != null) {
  //         googleUserEmail.value = firebaseUser.email!;
  //         googleUserId.value = firebaseUser.uid;
  //         googleUserImg.value =
  //             firebaseUser.photoURL ?? 'no profile picture'.tr;
  //       }
  //       Get.offAll(() => const HomeView(), binding: HomeBinding());
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<void> handleGoogleSignOut() async {
  //   final GoogleSignIn googleSignIn = GoogleSignIn();
  //   await googleSignIn.signOut();
  //   FirebaseAuth.instance.signOut();
  //   googleUserEmail.value = '';
  //   googleUserId.value = '';
  //   googleUserImg.value = '';
  // }
}
