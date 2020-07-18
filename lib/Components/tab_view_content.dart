import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TabViewContent extends StatefulWidget {
  Color color;

  @override
  _TabViewContentState createState() => _TabViewContentState();
}

class _TabViewContentState extends State<TabViewContent>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _controller = TabController(vsync: this, length: 3);
      _controller.addListener(_handleTabSection);
    });
  }

  void _handleTabSection() {
    setState(() {
      widget.color = Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
              controller: _controller,
              isScrollable: true,
              indicatorWeight: 5.0,
              indicatorColor: Colors.grey,
              onTap: (index) {},
              tabs: <Widget>[
                Container(
                  child: Text('title',
                      style: TextStyle(
                        fontFamily: 'cairo',
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Container(
                  child: Text('title',
                      style: TextStyle(
                        fontFamily: 'cairo',
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Container(
                  child: Text('title',
                      style: TextStyle(
                        fontFamily: 'cairo',
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                )
              ]),
        ),
      ),
    );
  }
}
