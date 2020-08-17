import 'package:flutter/material.dart';

class MyCarItem extends StatelessWidget {
  final String image , brandName , modelName , year ;
  final int id ;

  const MyCarItem({Key key, this.image, this.brandName, this.modelName, this.year, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.zero,

      width: MediaQuery.of(context).size.width,
      height: 140,
      decoration: BoxDecoration(
        color: Colors.black,
            borderRadius: BorderRadius.circular(15),

      ),
      child: Row(
        children: <Widget>[
          Container(
           width: MediaQuery.of(context).size.width /3,
            height: 140,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15) , bottomLeft: Radius.circular(15)),
              image: DecorationImage(
                image: NetworkImage(image , scale: 1.0),
                fit: BoxFit.fill
              )
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(modelName , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 17),textAlign: TextAlign.start,),
                  Text(brandName , style: TextStyle(color: Colors.white , fontWeight: FontWeight.normal , fontSize: 14),textAlign: TextAlign.start),
                  Text(year , style: TextStyle(color: Colors.white , fontSize: 12),textAlign: TextAlign.start),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
