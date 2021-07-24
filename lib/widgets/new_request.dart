import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewRequest extends StatefulWidget {
  final Function addreq;

  const NewRequest(this.addreq);

  @override
  _NewRequestState createState() => _NewRequestState();
}

class _NewRequestState extends State<NewRequest> {
  final _namecontroller = TextEditingController();
  final _detailcontroller = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _submitData() {
    if (_detailcontroller.text.isEmpty) {
      return;
    }
    final enteredName = _namecontroller.text;
    final entereddetails = _detailcontroller.text;

    widget.addreq(
      enteredName,
      entereddetails,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2030),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Name'),
              controller: _namecontroller,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Details'),
              controller: _detailcontroller,
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      'Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _presentDatePicker,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              child: const Text('new Request'),
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}
