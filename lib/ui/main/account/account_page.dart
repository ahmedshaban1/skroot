import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skroot/Components/CustomNetworkImage.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/helpers/shared_preference_manger.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/theming/colors.dart';
import 'package:skroot/ui/main/account/components/profile_item.dart';
import 'package:skroot/ui/main/master_page/get_from_shared_bloc.dart';
import 'dart:io';
import 'package:skroot/ui/main/account/account_details/account_details_bloc.dart';
import 'package:skroot/Components/custom_image_picker.dart';
import 'package:skroot/ui/common/loading_dialog.dart';




class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  void initState() {
    getFromShared.add(GetShared());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(lightThemeColors["surface-dim"]),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Center(
            child: Stack(
              children: <Widget>[
                Center(
                    child: Image.asset(
                      "assets/images/group_points.png",
                      height: 100,
                      width: 140,
                    )),
                InkWell(
                  onTap: (){
                    ImagePickerDialog().show(
                        context: context,
                        onGet: (v) {
                          print("_____________ user avatar image is $v");
                          accountDetailsBloC.imageChanged(v);
                          accountDetailsBloC.add(UpdatePhoto());
                          showLoadingDialog(context);
                        });
                  },
                  child: BlocBuilder(
                    bloc: getFromShared,
                    builder: (_, state) {
                      if (state is Start) {
                        return Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 35),
                              child: StreamBuilder<File>(
                                  stream: accountDetailsBloC.image,
                                  builder: (context, snapshot) {
                                    return snapshot.hasData
                                        ? CircleAvatar(
                                      radius: 40,
                                      backgroundColor: Colors.white,
                                      backgroundImage: Image.file(
                                        snapshot.data,
                                        fit: BoxFit.cover,
                                      ).image,
                                    )
                                        : CustomNetworkImage()
                                        .circleNewWorkImage(
                                        image:
                                        getFromShared.image,
                                        radius: 40);
                                  }),
                            ));
                      }
                      return Container();
                    },
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Text(
              "Preferences",
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 0),
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                ProfileItem(
                  icon: Icon(
                    Icons.person_outline,
                    color: Colors.white,
                    size: 14,
                  ),
                  text: "Account Details",
                  onClick: () {
                    NamedNavigatorImpl().push(Routes.ACCOUNT_DETAILS );
                  },
                ),
                ProfileItem(
                  icon: Icon(
                    Icons.directions_car,
                    color: Colors.white,
                    size: 14,
                  ),
                  text: "My Cars",
                  onClick: () {
                    NamedNavigatorImpl().push(Routes.MY_CARS_ROUTER );
                  },
                ),
//              ProfileItem(
//                icon: Icon(
//                  Icons.receipt,
//                  color: Colors.white,
//                  size: 14,
//                ),
//                text: "My Orders",
//                onClick: () {},
//              ),
                ProfileItem(
                  icon: Icon(
                    Icons.credit_card,
                    color: Colors.white,
                    size: 14,
                  ),
                  text: "Payment Methods",
                  onClick: () {},
                ),
                ProfileItem(
                  icon: Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 14,
                  ),
                  text: "My Addresses",
                  onClick: () {
                    NamedNavigatorImpl().push(Routes.MY_ADDRESSES_ROUTER );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
            child: Text(
              "More",
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                ProfileItem(
                  icon: Icon(
                    Icons.language,
                    color: Colors.white,
                    size: 14,
                  ),
                  text: "Select Language",
                  onClick: () {},
                ),
                ProfileItem(
                  icon: Icon(
                    Icons.call,
                    color: Colors.white,
                    size: 14,
                  ),
                  text: "Contact Us",
                  onClick: () {
                    NamedNavigatorImpl().push(Routes.CONTACT_US );
                  },
                ),
                ProfileItem(
                  icon: Icon(
                    Icons.flag,
                    color: Colors.white,
                    size: 14,
                  ),
                  text: "Report a problem",
                  onClick: () {},
                ),
                ProfileItem(
                  icon: Icon(
                    Icons.receipt,
                    color: Colors.white,
                    size: 14,
                  ),
                  text: "Privacy policy",
                  onClick: () {
                    NamedNavigatorImpl().push(Routes.TOPICS , arguments: "policy");
                  },
                ),
                ProfileItem(
                  icon: Icon(
                    Icons.headset,
                    color: Colors.white,
                    size: 14,
                  ),
                  text: "Help Center",
                  onClick: () {},
                ),
              ],
            ),
          ),

          InkWell(
            onTap: (){
              SharedPreferenceManager().logout();
              NamedNavigatorImpl().push(Routes.SPLASH_ROUTER , clean: true);
            },
            child: Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 5),
              decoration: BoxDecoration(
                  color: Colors.black12, borderRadius: BorderRadius.only(bottomRight: Radius.circular(20) , bottomLeft: Radius.circular(20))),
              padding: EdgeInsets.all(2),
              child:Padding (
                padding: const EdgeInsets.all(9.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(shape: BoxShape.circle ,  color: Colors.black26 ),
                          child: Icon(Icons.exit_to_app , color: Colors.red,),
                        ),
                        SizedBox(width: 10,),
                        Text("Logout" , style: TextStyle(color: Colors.red  , fontSize: 22 , fontWeight: FontWeight.bold ),)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
