import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/model/student.dart';
import '/providers/request_provider.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({Key? key}) : super(key: key);
  static const routeName = 'home-student';

  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    final _detailController = TextEditingController();

    DateTime _selectedDate = DateTime.now();

    final reqdata = Provider.of<StudentRequests>(context);

    void _presentDatePicker() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2022),
      ).then(
        (pickedDate) {
          if (pickedDate == null) {
            return;
          }
          setState(
            () {
              _selectedDate = pickedDate;
              reqdata.addItem(
                Student(
                  id: _selectedDate.toString(),
                  name: _nameController.text,
                  details: _detailController.text,
                  date: _selectedDate,
                ),
              );
            },
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student'),
      ),
      body: Form(
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Name'),
              controller: _nameController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Details'),
              controller: _detailController,
            ),
            ElevatedButton(
              onPressed: _presentDatePicker,
              child: const Text('Select Date'),
            ),
          ],
        ),
      ),
    );
  }
}
