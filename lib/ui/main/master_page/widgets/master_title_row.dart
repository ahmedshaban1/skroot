import 'package:flutter/material.dart';
import 'package:skroot/theming/colors.dart';
class MasterTitleRow extends StatelessWidget {
  final title ;
  final onTap ;

  const MasterTitleRow({Key key, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(child: Padding(
              padding: const EdgeInsets.only(left : 20.0 , right: 20.0),
              child: Text(title , style: TextStyle(fontSize:16.0,color: Colors.grey[500]),),
            )),
            Padding(
              padding: const EdgeInsets.only(left : 12.0 , right: 12.0),
              child: Icon(
                Icons.arrow_forward , color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
