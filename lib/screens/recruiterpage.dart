import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/request_provider.dart';

class RecruiterPage extends StatefulWidget {
  const RecruiterPage({Key? key}) : super(key: key);
  static const routeName = 'home-recruiter';

  @override
  _RecruiterPageState createState() => _RecruiterPageState();
}

class _RecruiterPageState extends State<RecruiterPage> {
  @override
  Widget build(BuildContext context) {
    final requests = Provider.of<StudentRequests>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recruiters Page'),
      ),
      body: requests.items.isEmpty
          ? Container(
              alignment: Alignment.center,
              child: const Text('You have no requests'),
            )
          : ListView.builder(
              itemBuilder: (ctx, i) {
                return ListTile(
                  contentPadding: const EdgeInsets.all(20),
                  leading: Text(requests.items.values.toList()[i].name),
                  title: Text(requests.items.values.toList()[i].details),
                  subtitle: Text(
                    requests.items.values.toList()[i].date.toString(),
                  ),
                  trailing: SizedBox(
                    width: 200,
                    child: Row(
                      children: [
                        ElevatedButton(
                          child: const Text('accept'),
                          onPressed: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title:
                                  Text(requests.items.values.toList()[i].name),
                              content: Text(
                                  requests.items.values.toList()[i].details),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Accept'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            requests.removeItem(
                                requests.items.values.toList()[i].id);
                          },
                          child: const Text('Decline'),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: requests.items.length,
            ),
    );
  }
}
