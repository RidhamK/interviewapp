import 'package:flutter/material.dart';

import '/screens/recruiterpage.dart';
import '/screens/studentlogin.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(StudentPage.routeName);
              },
              child: const Text('Student Page'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RecruiterPage.routeName);
              },
              child: const Text('Recruiters Page'),
            ),
          ],
        ),
      ),
    );
  }
}
