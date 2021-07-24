import 'package:flutter/material.dart';
import '../models/student.dart';
import 'request_item.dart';

class RequestList extends StatelessWidget {
  final List<Student> requests;
  final Function delreq;

  const RequestList(this.requests, this.delreq);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: requests.isEmpty
          ? LayoutBuilder(builder: (context, constrain) {
              return Column(
                children: [
                  const Text(
                    'No requests added yet!',
                  ),
                ],
              );
            })
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return RequstItem(
                  requests: requests[index],
                  delreq: delreq,
                );
              },
              itemCount: requests.length,
            ),
    );
  }
}
