import 'package:flutter/material.dart';
import 'package:skroot/models/lists/country_model.dart';
import 'package:skroot/theming/colors.dart';
import 'package:skroot/ui/authentication/sign_up/sign_up_bloc.dart';

class CustomBottomSheet extends StatefulWidget {
  final text;

  final width;

  final List<CountryModel>list;

  final inputIcon;

  final Function onItemClick;

  const CustomBottomSheet(
      {Key key,
      this.text,
      this.width,
      this.list,
      this.inputIcon,
      this.onItemClick})
      : super(key: key);

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {


  var shownText = "";
  @override
  void initState() {
    // TODO: implement initState
shownText =     widget.text;

    super.initState();
  }
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
                          widget.onItemClick(index);
                          setState(() {

                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "${widget.list[index].nameEn}",
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

                  Text(widget.text,
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
