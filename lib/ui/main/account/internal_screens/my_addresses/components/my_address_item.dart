import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyAddressItem extends StatelessWidget {
  final String title , address;
 final Function onEditClick;
  final Function onDeleteClick;

  const MyAddressItem({Key key, this.title, this.address, this.onEditClick, this.onDeleteClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => onDeleteClick(),
        ),
        IconSlideAction(
          caption: 'Edit',
          color: Colors.green,
          icon: Icons.edit,
          onTap: () => onEditClick(),
        )
      ],
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.zero,

        width: MediaQuery.of(context).size.width,
        height: 140,
        decoration: BoxDecoration(
          color: Colors.black,
              borderRadius: BorderRadius.circular(15),

        ),
        child: Column(
          children: <Widget>[
            Text(title , style: TextStyle(color: Colors.white , fontSize: 16 , fontWeight: FontWeight.bold) ,textAlign: TextAlign.start,),
            SizedBox(height: 5,),
            Text( address, style: TextStyle(color: Colors.grey , fontSize: 14 , fontWeight: FontWeight.normal),textAlign: TextAlign.start),

          ],
        ),
      ),
    );
  }
}
