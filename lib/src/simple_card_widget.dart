import 'package:flutter/material.dart';

class SimpleCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const SimpleCardWidget({Key? key, this.title = "asd", this.subtitle = "asd"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 8),
        // width: double.infinity,
        // height: 100,
        child: Card(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              title: Text("title"),
              subtitle: Text("subtitle"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const <Widget>[
                TextButton(child: Text("Here"), onPressed: null),
                SizedBox(width: 8),
              ],
            ),
          ],
        )));
  }
}
