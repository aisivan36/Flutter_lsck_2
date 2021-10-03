import 'package:flutter/material.dart';

class MainMi extends StatelessWidget {
  const MainMi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/images/pic4.png'),
              ),
              const Text(
                'Spider',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Flutter Developer',
                style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20.0,
                    color: Colors.teal.shade100,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.add_shopping_cart,
                      size: 70.0,
                      color: Colors.teal.shade200,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
