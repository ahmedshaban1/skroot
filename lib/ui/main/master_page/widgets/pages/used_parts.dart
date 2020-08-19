import 'package:flutter/material.dart';
class UsedParts extends StatefulWidget {
  @override
  _UsedPartsState createState() => _UsedPartsState();
}

class _UsedPartsState extends State<UsedParts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Used Parts" , style: Theme.of(context).textTheme.title,),
      ),
    );
  }
}
