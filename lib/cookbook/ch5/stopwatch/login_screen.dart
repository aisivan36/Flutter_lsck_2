import 'package:flutter/material.dart';
import 'package:lsck/cookbook/ch5/stopwatch/stopwatchapp.dart';

class LoginScreen extends StatefulWidget {
  static const route = '/login';

  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loggedin = false;
  String? name;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _validate() {
    final form = _formKey.currentState;
    if (!form!.validate()) {
      return;
    }
    // if (form != null) {
    // }

    final name = _nameController.text;
    // final email = _emailController.text;

    Navigator.of(context)
        .pushReplacementNamed(StopWatchApp.route, arguments: name);
    // setState(() {
    //   loggedin = true;
    //   name = _nameController.text;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: _buildLoginForm(),
      ),
    );
  }

  // Widget _buildSuccess() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Icon(
  //         Icons.check,
  //         color: Colors.orangeAccent,
  //       ),
  //       Text('Hi $name')
  //     ],
  //   );
  // }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Runner'),
              validator: (text) {
                if (text != null) {
                  // if (text.isEmpty) {
                  //   return 'Enter the runner\'s name';
                  // } else {
                  //   return null;
                  // }
                  return text.isEmpty ? 'Enter the runner\'s name' : null;
                }
              },
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              validator: (text) {
                //Check if it's not null
                if (text != null) {
                  if (text.isEmpty) {
                    return 'Enter the runner\'s email';
                  }
                  // ignore: unnecessary_string_escapes
                  final regex = RegExp('[^@]+@[^\.]+\..+');
                  if (!regex.hasMatch(text)) {
                    return 'Enter a valid email';
                  }
                }

                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: _validate, child: const Text('Continue')),
          ],
        ),
      ),
    );
  }
}
