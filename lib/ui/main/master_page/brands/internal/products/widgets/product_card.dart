import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skroot/Components/CustomNetworkImage.dart';
import 'package:skroot/models/cars/products/products_model.dart';
import 'package:skroot/theming/colors.dart';

class ProductCard extends StatefulWidget {
  final onTap;
  final  model;

  const ProductCard({Key key, this.onTap, this.model}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool favState = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Color(lightThemeColors["sign-bg"])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomNetworkImage().containerNewWorkImage(
                    image: widget.model.partCategory.imageUrl,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .18,
                    radius: 30
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                     widget.model.price.toString() + " AED",
                      style: TextStyle(color: Colors.grey[300], fontSize: 12),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.grey[800]),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            widget.model.carBrand.name.en,
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                widget.model.description.en,
                  maxLines: 2,
                  style: TextStyle(fontSize: 10),
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                favState = !favState;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.grey[300],
                    child: Icon(
                      favState? Icons.favorite : Icons.favorite_border,
                      color:favState ? Colors.red: Colors.grey,
                      size: 15,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
