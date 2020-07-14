import 'package:flutter/material.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';

class DefaultAppBar extends PreferredSize {

  final String appBarTitle ;

  DefaultAppBar(this.appBarTitle);


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme
          .of(context)
          .primaryColor,
      elevation: 0,
      centerTitle: true,
      leading: InkWell(
          onTap: () {
          NamedNavigatorImpl().pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).primaryColor,
          )),
      title: Text(appBarTitle,style: TextStyle(fontSize: 14 ,color: Theme.of(context).primaryColor),
    ));
  }
}
