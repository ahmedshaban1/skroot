import 'package:flutter/material.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';

class CustomAppBarBg extends StatelessWidget {
  final text;

  final onDrawerClick;

  final openNotification;

  final widget ;


  const CustomAppBarBg(
      {Key key, this.text, this.onDrawerClick, this.openNotification, this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .08,
      margin: EdgeInsets.only(top: 20, bottom: 5),
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
         InkWell(
                  onTap: (){
                    NamedNavigatorImpl().pop();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 70,
                    child: Center(
                      child: Icon(
                        Icons.arrow_back,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          InkWell(
                  onTap: openNotification,
                  child: Container(
                    width: 70,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.shopping_basket,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
