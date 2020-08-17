import 'package:flutter/material.dart';
class ContainerCard{
  Widget containerCard(

      {String name,
        Color containerColor,
        Color textColor,
        GestureTapCallback onTap,
        double width ,double radius ,double height , Widget widget}) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(radius ?? 30))),
        child: Container(
          alignment: Alignment.center,
          width: width*.28,
          height: height ?? 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 30)),
              color: containerColor
          ),
          child: widget != null ? widget : Center(
              child: Text(
                name,
                style: TextStyle(
                    fontSize: 14,
                    color: textColor == null ? Colors.white : textColor,
                    fontFamily: "cairo"),
                textAlign: TextAlign.center,
              )),
        ),
      ),
    );
  }
  Widget containerCardWithOutOnTap(
      String cityName,
      String stateName,
      Color containerColor,
      Color textColor,
      double width ,
      Color borderColor,
      {double radius , Widget widget}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width*.43,
        height: 60,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor , width: 2),
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 30)),
            color: containerColor
        ),
        child: widget != null ? widget : Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  stateName,
                  style: TextStyle(
                      fontSize: 13,
                      color: textColor == null ? Colors.white : textColor,
                      fontFamily: "cairo"),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "-",
                  style: TextStyle(
                      fontSize: 15,
                      color: textColor == null ? Colors.white : textColor,
                      fontFamily: "cairo"),
                  textAlign: TextAlign.center,
                ),
                Text(
                  cityName,
                  style: TextStyle(
                      fontSize: 13,
                      color: textColor == null ? Colors.white : textColor,
                      fontFamily: "cairo"),
                  textAlign: TextAlign.center,
                ),
              ],
            )),
      ),
    );
  }
}