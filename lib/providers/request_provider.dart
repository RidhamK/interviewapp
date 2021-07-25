import 'package:flutter/material.dart';
import '/model/student.dart';

class StudentRequests with ChangeNotifier {
  final Map<String, Student> _items = {};

  Map<String, Student> get items {
    return {..._items};
  }

  void addItem(Student newStudentRequestData) {
    _items.putIfAbsent(
      newStudentRequestData.id,
      () => Student(
        id: newStudentRequestData.id,
        name: newStudentRequestData.name,
        details: newStudentRequestData.details,
        date: newStudentRequestData.date,
      ),
    );

    notifyListeners();
  }

  void removeItem(String sId) {
    _items.remove(sId);
    notifyListeners();
  }
}
