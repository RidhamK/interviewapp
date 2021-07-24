import '/models/student.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RequstItem extends StatelessWidget {
  const RequstItem({
    Key? key,
    required this.requests,
    required this.delreq,
  }) : super(key: key);

  final Student requests;
  final Function delreq;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        title: Text(requests.detail),
        subtitle: Text(
          DateFormat.yMMMd().format(requests.date),
        ),
        trailing: ElevatedButton.icon(
          onPressed: () => delreq(requests.id),
          icon: const Icon(Icons.delete),
          label: const Text('Delete'),
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Theme.of(context).errorColor,
          ),
        ),
      ),
    );
  }
}
