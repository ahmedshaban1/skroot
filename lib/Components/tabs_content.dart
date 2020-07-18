import 'package:flutter/material.dart';

class TabsContent extends StatelessWidget {
  final String title;
  final font ;

  TabsContent(this.title, this.font);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        /*  decoration: BoxDecoration(
            borderRadius: new BorderRadius.circular(30),
            border: new Border.all(
                color: Color.fromRGBO(147, 40, 247, 1), width: 1)),*/
        child: Text(title,
            style: TextStyle(
              fontFamily: 'cairo',
              fontSize: font,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
