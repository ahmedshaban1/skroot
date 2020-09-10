import 'package:flutter/material.dart';
import 'package:skroot/Components/image_bg.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/theming/colors.dart';
import 'package:skroot/ui/main/master_page/widgets/custom_tap_bar.dart';
import 'package:skroot/ui/main/master_page/widgets/master_bg.dart';
import 'package:skroot/ui/main/master_page/widgets/pages/accessories/accessories.dart';
import 'package:skroot/ui/main/master_page/widgets/pages/pages_streams.dart';
import 'package:skroot/ui/main/master_page/widgets/pages/used_parts.dart';

import 'widgets/pages/new_parts.dart';

class MasterPage extends StatefulWidget {
  @override
  _MasterPageState createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  @override
  void initState() {
    pagesStreams.usedPartsChanged(false);
    pagesStreams.accessoriesChanged(false);
    pagesStreams.newPartsChanged(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(lightThemeColors["sign-bg"]),
        body: Stack(
          children: <Widget>[
            ImageBG(
              image: "assets/images/home_page_bg_full.png",
            ),
            //master bg
            MasterBg(),
            // master
            Container(
              padding: EdgeInsets.only(
                top: height * .2,
                bottom: 10,
              ),
              child: ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: <Widget>[
                  CustomTabBar(
                    list: list,
                  ),
                  StreamBuilder<bool>(
                      stream: pagesStreams.newStream,
                      builder: (context, snapshot) {
                        return Visibility(
                          visible: pagesStreams.newParts.value,
                          child: NewParts(),
                        );
                      }),
                  StreamBuilder<bool>(
                      stream: pagesStreams.usedStream,
                      builder: (context, snapshot) {
                        return Visibility(
                          visible: pagesStreams.usedParts.value,
                          child: UsedParts(),
                        );
                      }),
                  StreamBuilder<bool>(
                      stream: pagesStreams.accessoriesStream,
                      builder: (context, snapshot) {
                        return Visibility(
                          visible: pagesStreams.accessories.value,
                          child: Accessories(),
                        );
                      }),
                ],
              ),
            ),
            // search
            Container(
              padding: EdgeInsets.only(
                top: height * .15,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                    },
                    child: Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                      child: InkWell(
                        onTap: (){
                          NamedNavigatorImpl().push(Routes.FILTER_PAGE_ROUTER);
                        },
                        child: Container(
                          width: width * .8,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color(lightThemeColors["sign-bg"])),
                          child: TextField(
                            enabled: false,
                            onChanged: null,
                            onSubmitted: null,
                            style: const TextStyle(
                                color: Colors.white, fontFamily: 'cairo'),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                icon: Icon(Icons.search, color: Colors.white),
                                onPressed: () {
                                },
                              ),
                              hintText: "Search on a brand",
                              hintStyle: TextStyle(color: Colors.grey),
                              contentPadding: const EdgeInsets.only(
                                  top: 15.0,
                                  right: 10.0,
                                  bottom: 10.0,
                                  left: 12.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  var list = [
    {
      "name": "New parts",
      "containerColor": Color(lightThemeColors["sign-bg"]),
      "txtColor": Colors.white,
    },
    {
      "name": "Used Parts",
      "containerColor": Colors.black87,
      "txtColor": Colors.grey[600],
    },
    {
      "name": "Accessories",
      "containerColor": Colors.black87,
      "txtColor": Colors.grey[600],
    },
  ];
}
