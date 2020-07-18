import 'dart:math';

import 'package:flutter/material.dart';
class CustomOptionCard{
  Widget optionCard({String label, IconData icon, Function onTap}) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: onTap,
        child: ListView(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Visibility(
                  visible: icon != null,
                  child: Icon(
                    icon,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
                Expanded(
                  child: Text(
                    label,
                    textAlign: TextAlign.end,
                    style: TextStyle( color: Colors.black87,fontSize: 17),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Divider(
              height: 1,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }

}