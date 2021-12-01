import 'package:flutter/material.dart';

class SimpleCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String answers;

  const SimpleCardWidget(
      {Key? key, this.title = "", this.subtitle = "", this.answers = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 8),
        child: Card(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(title),
                subtitle: Text(subtitle),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Flexible(
                    child: Text(answers),
                  ),
                  SizedBox(width: 8),
                ],
              ),
            ],
          ),
        )));
  }
}
