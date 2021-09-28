import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _message = '';
  bool _isLogin = true;
  final TextEditingController txtUserName = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container();
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
          onPressed: () {},
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
