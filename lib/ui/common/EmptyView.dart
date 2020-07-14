import 'package:flutter/material.dart';
class EmptyView extends StatelessWidget {
  final String text;

  const EmptyView({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Icon(
            Icons.no_sim,
            color: Theme.of(context).primaryColor,
            size: 150,
          ),
          Text(text??"لا توجد بيانات " ,)
        ],
      ),
    );
  }

}
