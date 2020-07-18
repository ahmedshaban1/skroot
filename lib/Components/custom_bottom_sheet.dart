import 'package:flutter/material.dart';
import 'package:skroot/theming/colors.dart';

class CustomBottomSheet extends StatefulWidget {
  final text;

  final width;

  final list;

  final inputIcon;

  final stateOfSheet;

  const CustomBottomSheet(
      {Key key,
      this.text,
      this.width,
      this.list,
      this.inputIcon,
      this.stateOfSheet})
      : super(key: key);

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  String country ;
  String city  ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        showModalBottomSheet(
            backgroundColor: Colors.black12,
            context: context,
            builder: (_) {
              return Container(
                height: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(10.0),
                      topRight: const Radius.circular(10.0),
                    ),
                    color: Color(lightThemeColors['sign-text'])),
                child: ListView.builder(
                    itemCount: widget.list.length,
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          if (widget.stateOfSheet == 1) {
                            print("__________________ : hay country");
                            country = widget.list[index];
                          } else {
                            print("__________________ : hay city");
                            city = widget.list[index];
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "${widget.list[index]}",
                            style: Theme.of(context).textTheme.title.copyWith(
                              fontWeight: FontWeight.w200 ,
                              fontSize: 18,
                              color: Colors.white

                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }),
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color(lightThemeColors['sign-bg'])),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right:8.0 , left: 8.0),
                    child: Icon(
                      widget.inputIcon,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  city == null ?
                  Text(country != null ? country : widget.text,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(lightThemeColors["sign-text"])))
                      :
                  Text(city != null ? city : widget.text,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(lightThemeColors["sign-text"])))
                ],
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
