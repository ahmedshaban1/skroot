import 'package:flutter/material.dart';

class CurveBasicCard extends StatefulWidget {
  final List<Widget> children;
  final IconData icon;

  const CurveBasicCard({Key key, this.children, this.icon}) : super(key: key);

  @override
  _CurveBasicCardState createState() => _CurveBasicCardState();
}

class _CurveBasicCardState extends State<CurveBasicCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10, left: 10),
      child: Card(
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.only(right: 10, left: 10, top: 50, bottom: 50),
          child: ListView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: widget.children,
          ),
        ),
      ),
    );
  }
}
