import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skroot/Components/CustomNetworkImage.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/helpers/localization.dart';
import 'package:skroot/ui/main/master_page/get_from_shared_bloc.dart';
class MasterBg extends StatefulWidget {
  final title ;

  const MasterBg({Key key, this.title}) : super(key: key);
  @override
  _MasterBgState createState() => _MasterBgState();
}

class _MasterBgState extends State<MasterBg> {
  @override
  void initState() {
    getFromShared.add(GetShared());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    return Stack(
      children: <Widget>[
        BlocBuilder(
          bloc: getFromShared,
          builder: (_ , state){
            return Container(
              padding: EdgeInsets.only(   right: 18 , left: 18),
              height: height*.17,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    height : height *.17,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.title != null ? "" : "hi "+getFromShared.username+" ,," ,
                          style: TextStyle(fontSize: 15),
                        ),
                        Container(
                          child: Text( widget.title ??
                            AppLocalization.of(context)
                                .getLocalizedText("home"),
                            style: Theme.of(context).textTheme.title.copyWith(
                                fontSize: 18
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomNetworkImage().circleNewWorkImage(
                    image: getFromShared.image ,
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
