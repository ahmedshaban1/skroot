import 'package:flutter/material.dart';
import 'package:skroot/Components/CustomNetworkImage.dart';
import 'package:skroot/models/cars/accessories/accessories_model.dart';
import 'package:skroot/theming/colors.dart';

class RecentlyAddCard extends StatefulWidget {
  final onTap;
  final model ;

  const RecentlyAddCard({Key key, this.onTap, this.model}) : super(key: key);

  @override
  _RecentlyAddCardState createState() => _RecentlyAddCardState();
}

class _RecentlyAddCardState extends State<RecentlyAddCard> {
  bool favState = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Card(
        color:Color(lightThemeColors["sign-bg"]),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Container(
            decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            height: 100,
            child: Row(
              children: <Widget>[
                CustomNetworkImage().containerNewWorkImage(
                  image: widget.model.partCategory.imageUrl,
                  width: 100,
                  height: 100,
                  radius: 10
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(widget.model.name.en),
                                Text(widget.model.description.en , overflow: TextOverflow.ellipsis,textAlign: TextAlign.start,),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                favState = !favState ;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                               favState? Icons.favorite : Icons.favorite_border,
                                color:favState ? Colors.red: Colors.grey,
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(widget.model.price.toStringAsFixed(2)),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12.0, right: 12.0),
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    color: Colors.purple[800]),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    "El-Doblomasy",
                                    style: TextStyle(
                                      fontSize: 13,
                                        color: Colors.purpleAccent,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
