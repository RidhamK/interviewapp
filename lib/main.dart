import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/request_provider.dart';

import './screens/recruiterpage.dart';
import './screens/homepage.dart';
import './screens/studentlogin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StudentRequests(),
      child: MaterialApp(
        title: 'InterviewApp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
        routes: {
          StudentPage.routeName: (ctx) => const StudentPage(),
          RecruiterPage.routeName: (ctx) => const RecruiterPage(),
        },
      ),
    );
  }
}
