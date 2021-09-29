import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lsck/codelabs/initial_firebase/src/widgets.dart';

class MainFirebaseGoogle extends StatelessWidget {
  const MainFirebaseGoogle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Google Codelabs',
      theme: ThemeData(
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              highlightColor: Colors.green,
            ),
        primaryColor: Colors.deepOrange,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Google'),
      ),
      body: ListView(
        children: [
          Image.asset('assets/images/social.png'),
          const SizedBox(
            height: 8,
          ),
          const IconAndDetail(detail: 'October 22', icon: Icons.calendar_today),
          const IconAndDetail(
              detail: 'Perth Australia', icon: Icons.location_city),
          const Divider(
            height: 8,
            thickness: 1,
            indent: 8,
            endIndent: 8,
            color: Colors.grey,
          ),
          const Header(heading: 'What we will be doing!'),
          const Paragraph(
              content:
                  'You can join with us for tutorial how to setup firebase on android with flutter'),
        ],
      ),
    );
  }
}
