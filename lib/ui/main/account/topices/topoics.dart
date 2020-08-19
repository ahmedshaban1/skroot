import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skroot/Components/image_bg.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/models/topics_model.dart';
import 'package:skroot/theming/colors.dart';
import 'package:skroot/ui/common/loader.component.dart';
import 'package:skroot/ui/main/account/topices/topices_bloc.dart';
import 'package:skroot/ui/main/master_page/widgets/master_bg.dart';
class Topics extends StatefulWidget {
  final String type ;

  const Topics({Key key, this.type}) : super(key: key);
  @override
  _TopicsState createState() => _TopicsState();
}

class _TopicsState extends State<Topics> {
  @override
  void initState() {
    if(widget.type.contains("terms")){
      getTopicsBloC.add(Hydrate());
    }else{
      getTopicsBloC.add(Click());
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    return Scaffold(
        backgroundColor: Color(lightThemeColors["sign-bg"]),
        body: BlocBuilder(
          bloc: getTopicsBloC,
          builder: (_ , state){
            if(state is Done){
              var model = state.model as TopicsModel ;
              return Stack(
                children: <Widget>[
                  ImageBG(image: "assets/images/home_page_bg_full.png",),
                  //master bg
                  MasterBg(
                    title: model.title.en ,
                  ),
                  // master
                  Container(
                    padding: EdgeInsets.only(top: height*.1 , bottom: 10,),
                    child: ListView(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(model.content.en, ),
                      )
                      ],
                    ),
                  ),
                  // search

                ],
              );
            }else{
              return Center(
                child: AppLoader(),
              );
            }
          },
        ));
  }
}
