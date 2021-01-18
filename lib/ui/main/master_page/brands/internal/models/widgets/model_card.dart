import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:skroot/models/cars/model/brand_model_response.dart';
class ModelCard extends StatelessWidget {
  final onTap;
  final Data model ;

  const ModelCard({Key key, this.onTap, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            height: MediaQuery.of(context).size.height*.16,
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width*.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.black87,
                      image: DecorationImage(
                          image: Image.network(model.imageUrl).image,
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(model.name.en ,  style: TextStyle(fontWeight: FontWeight.bold , color: Colors.grey[300])),
                      Row(
                        children: <Widget>[
                          Text("253 " , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.grey[300]),),
                          Text("pst" , style: TextStyle( fontSize: 13),),
                        ],
                      ), Row(
                        children: <Widget>[
                          Text("car model " , style: TextStyle(  fontSize: 13),),
                          Text("-" , style: TextStyle( fontSize: 13),),
                          Text("car year", style: TextStyle( fontSize: 13),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      RatingBar(
                        initialRating: 3,
                        minRating: 1,
                        itemSize: 15.0,
                        ignoreGestures: true,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        unratedColor: Colors.grey,
                        itemPadding:
                        EdgeInsets.symmetric(horizontal: 4.0),
                        ratingWidget: RatingWidget(
                            empty: Icon(
                              Icons.star,
                              size: 10,
                              color: Colors.grey,
                            ),
                            full: Icon(
                              Icons.star,
                              size: 10,
                              color: Colors.amber,
                            ), half: Icon(
                          Icons.star,
                          size: 10,
                          color: Colors.amber,
                        )
                        ),
                        onRatingUpdate: (double value) {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
