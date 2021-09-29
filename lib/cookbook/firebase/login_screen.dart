import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lsck/cookbook/firebase/shared/firebase_authentication.dart';

class LoginScreenFirebase extends StatefulWidget {
  const LoginScreenFirebase({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenFirebase> {
  String _message = '';
  bool _isLogin = false;
  final TextEditingController txtUserName = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  FirebaseAuthentication? auth;

  @override
  void initState() {
    Firebase.initializeApp().whenComplete(() {
      auth = FirebaseAuthentication();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              auth!.logout().then((value) {
                if (value) {
                  setState(() {
                    _message = 'User Logged Out';
                  });
                } else {
                  _message = 'Unable to Log Out';
                }
              });
            },
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(36),
        child: ListView(
          children: [
            userInput(),
            passwordInput(),
            btnMain(),
            btnSecondary(),
            txtMessage(),
          ],
        ),
      ),
    );
  }

  Widget userInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 128),
      child: TextFormField(
        controller: txtUserName,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          hintText: 'User Name',
          icon: Icon(Icons.verified_user),
        ),
        validator: (text) => text!.isEmpty ? 'User Name is required' : '',
      ),
    );
  }

  Widget passwordInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: TextFormField(
        controller: txtPassword,
        keyboardType: TextInputType.emailAddress,
        obscureText: true,
        decoration: const InputDecoration(
          hintText: 'Password',
          icon: Icon(Icons.enhanced_encryption),
        ),
        validator: (text) => text!.isEmpty ? 'Password is required' : '',
      ),
    );
  }

  /// Main Button Screen
  Widget btnMain() {
    String btnText = _isLogin ? 'Log in' : 'Sign up';
    return Padding(
      padding: const EdgeInsets.only(top: 128),
      child: SizedBox(
        height: 60,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Theme.of(context).primaryColorLight),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
                side: const BorderSide(color: Colors.red),
              ),
            ),
          ),
          child: Text(
            btnText,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).primaryColorLight,
            ),
          ),
          onPressed: () {
            String userId = '';
            if (_isLogin) {
              auth!.login(txtUserName.text, txtPassword.text).then((value) {
                if (value == null) {
                  setState(() {
                    _message = 'Login Error';
                  });
                } else {
                  userId = value;
                  setState(() {
                    _message = 'User $userId succesfully logged in';
                  });
                }
              });
            } else {
              auth!
                  .createUser(txtUserName.text, txtPassword.text)
                  .then((value) {
                if (value == null) {
                  setState(() {
                    _message = 'Registration Error';
                  });
                } else {
                  userId = value;
                  setState(() {
                    _message = 'User $userId successfully signed in';
                  });
                }
              });
            }
          },
        ),
      ),
    );
  }

  Widget btnSecondary() {
    String buttonText = _isLogin ? 'Sign up' : 'Log in';

    return TextButton(
      child: Text(buttonText),
      onPressed: () {
        setState(() {
          _isLogin = !_isLogin;
        });
      },
    );
  }

  /// Custom Error Message for the user input
  Widget txtMessage() {
    return Text(
      _message,
      style: TextStyle(
        fontSize: 16,
        color: Theme.of(context).primaryColorDark,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
