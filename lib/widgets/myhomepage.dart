import 'package:flutter/material.dart';

import './new_request.dart';
import './requestlist.dart';
import '../models/student.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Student> _studentRequest = [];

  void _addNewRequest(String name, String details, DateTime chosenDate) {
    final newTx = Student(
      detail: details,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _studentRequest.add(newTx);
    });
  }

  void _startaddnewrequest(BuildContext ctx) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewRequest(_addNewRequest),
        );
      },
    );
  }

  void _deletRequest(String id) {
    setState(() {
      _studentRequest.removeWhere((tx) => tx.id == id);
    });
  }

  List<Widget> _buildLandscap(Widget reqListWidget) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
      reqListWidget
    ];
  }

  @override
  Widget build(BuildContext context) {
    final reqListWidget = Container(
      height: 100,
      child: RequestList(_studentRequest, _deletRequest),
    );
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ..._buildLandscap(
              reqListWidget,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _startaddnewrequest(context),
      ),
    );
  }
}
