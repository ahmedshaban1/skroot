import 'package:flutter/material.dart';
import 'package:skroot/theming/colors.dart';

class RecentlyAddCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
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
              Container(
                width: 80,
                decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black87,
                    image: DecorationImage(
                        image: Image.asset("assets/images/logo.png").image,
                        fit: BoxFit.cover)),
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
                          child: Text("name of the product "),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("45/UED"),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 12.0, right: 12.0),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: Colors.purple[200]),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  "El-Doblomasy",
                                  style: TextStyle(
                                    fontSize: 13,
                                      color: Theme.of(context).primaryColor,
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
        ));
  }
}
