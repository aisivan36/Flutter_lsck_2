// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:lsck/codelabs/initial_firebase/src/authentication.dart';
// import 'package:lsck/codelabs/initial_firebase/src/widgets.dart';
// import 'package:provider/provider.dart';

// /// The main Home runApp from the main `ApplicationState` -----------------
// class ApplicationState extends ChangeNotifier {
//   ApplicationState() {
//     init();
//   }

//   Future<void> init() async {
//     await Firebase.initializeApp();

//     FirebaseAuth.instance.userChanges().listen((user) {
//       if (user != null) {
//         _loginState = ApplicationLoginState.loggedIn;
//       } else {
//         _loginState = ApplicationLoginState.loggedOut;
//       }
//       notifyListeners();
//     });
//   }

//   ApplicationLoginState _loginState = ApplicationLoginState.loggedOut;

//   ApplicationLoginState get loginState {
//     return _loginState;
//   }

//   String? _email;
//   String? get email {
//     return _email;
//   }

//   void startLoginFlow() {
//     _loginState = ApplicationLoginState.emailAddress;
//     notifyListeners();
//   }

//   void verifyEmail(
//     String email,
//     void Function(FirebaseAuthException e) errorCallback,
//   ) async {
//     try {
//       var methods =
//           await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
//       if (methods.contains('password')) {
//         _loginState = ApplicationLoginState.password;
//       } else {
//         _loginState = ApplicationLoginState.register;
//       }
//       _email = email;
//       notifyListeners();
//     } on FirebaseAuthException catch (error) {
//       errorCallback(error);
//     }
//   }

//   void signInWithEmailAndPassword(
//     String email,
//     String password,
//     void Function(FirebaseAuthException e) errorCallback,
//   ) async {
//     try {
//       await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);
//     } on FirebaseAuthException catch (error) {
//       errorCallback(error);
//     }
//   }

//   void cancelRegistration() {
//     _loginState = ApplicationLoginState.emailAddress;
//     notifyListeners();
//   }

//   void registerAccount(String email, String displayName, String password,
//       void Function(FirebaseAuthException e) errorCallback) async {
//     try {
//       var credential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//       await credential.user!.updatePhotoURL(displayName);
//     } on FirebaseAuthException catch (error) {
//       errorCallback(error);
//     }
//   }

//   void signOut() {
//     FirebaseAuth.instance.signOut();
//   }
// }

// class MainFirebaseGoogle extends StatelessWidget {
//   const MainFirebaseGoogle({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Firebase Google Codelabs',
//       theme: ThemeData(
//         buttonTheme: Theme.of(context).buttonTheme.copyWith(
//               highlightColor: Colors.green,
//             ),
//         primaryColor: Colors.deepOrange,
//         textTheme: GoogleFonts.robotoTextTheme(
//           Theme.of(context).textTheme,
//         ),
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: const HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Firebase Google'),
//       ),
//       body: ListView(
//         children: [
//           Image.asset('assets/images/social.png'),
//           const SizedBox(
//             height: 8,
//           ),
//           const IconAndDetail(detail: 'October 22', icon: Icons.calendar_today),
//           const IconAndDetail(
//               detail: 'Perth Australia', icon: Icons.location_city),
//           Consumer<ApplicationState>(
//             builder: (context, appState, _) => Authentication(
//                 loginState: appState._loginState,
//                 email: appState.email,
//                 startLoginFlow: appState.startLoginFlow,
//                 verifyEmail: appState.verifyEmail,
//                 signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
//                 cancelRegistration: appState.cancelRegistration,
//                 registerAccount: appState.registerAccount,
//                 signOut: appState.signOut),
//           ),
//           const Divider(
//             height: 8,
//             thickness: 1,
//             indent: 8,
//             endIndent: 8,
//             color: Colors.grey,
//           ),
//           const Header(heading: 'What we will be doing!'),
//           const Paragraph(
//               content:
//                   'You can join with us for tutorial how to setup firebase on android with flutter'),
//         ],
//       ),
//     );
//   }
// }
