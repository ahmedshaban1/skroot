import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skroot/Components/custom_back_arrow.dart';
import 'package:skroot/Components/custom_bottom_sheet.dart';
import 'package:skroot/Components/custom_sheet_container.dart';
import 'package:skroot/Components/inputTextField.dart';
import 'package:skroot/helpers/localization.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/theming/colors.dart';
import 'package:skroot/ui/authentication/sign_up/sign_up_bloc.dart';
import 'package:skroot/ui/common/CustomButton.dart';
import 'package:skroot/ui/common/error_dialog.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Color activeColor = Color(lightThemeColors["sign-text"]) ;
  bool isChecked = false ;
  final _blank = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(_blank);
        },
        child: BlocListener(
          listener: (context, state) {},
          bloc: signUpBloC,
          child: Stack(
            children: <Widget>[
              BlocBuilder(
                  bloc: signUpBloC,
                  builder: (context, state) {
                    return ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20 , bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                "assets/images/sign_up_image.png",
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              AppLocalization.of(context)
                                  .getLocalizedText("join_us"),
                              style: Theme.of(context).textTheme.title.copyWith(
                                color: Theme.of(context).primaryColor
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .7,
                              child: Text(
                                AppLocalization.of(context)
                                    .getLocalizedText("sign_des"),
                                style: Theme.of(context).textTheme.display1,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: StreamBuilder<String>(
                              stream: signUpBloC.userName,
                              builder: (context, snapshot) {
                                return InputFieldArea(
                                  icon: Padding(
                                    padding: const EdgeInsets.only(right:8.0 , left: 8.0),
                                    child: Icon(
                                      Icons.person_outline,
                                      color: Colors.white,
                                    ),
                                  ),
                                  hint: AppLocalization.of(context)
                                      .getLocalizedText("full_name"),
                                  errorTxt: snapshot.error,
                                  changedFunction: signUpBloC.userNameChanged,
                                  textInputType: TextInputType.number,
                                );
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: StreamBuilder<String>(
                              stream: signUpBloC.phoneNumber,
                              builder: (context, snapshot) {
                                return InputFieldArea(
                                  icon: Padding(
                                    padding: const EdgeInsets.only(right:8.0 , left: 8.0),
                                    child: Icon(
                                      Icons.phone,
                                      color: Colors.white,
                                    ),
                                  ),
                                  hint: AppLocalization.of(context)
                                      .getLocalizedText("phone"),
                                  errorTxt: snapshot.error,
                                  changedFunction: signUpBloC.updatePhone,
                                  textInputType: TextInputType.number,
                                );
                              }),
                        ),
                        CustomBottomSheet(
                          text: AppLocalization.of(context).getLocalizedText("country"),
                          inputIcon: FontAwesomeIcons.globeAfrica,
                          list: ["USA" , "Egypt"],
                          stateOfSheet: 1,
                        ),
                        CustomBottomSheet(
                          text: AppLocalization.of(context).getLocalizedText("city"),
                          inputIcon: Icons.explore,
                          list: ["NewYork" , "Mansoura"],
                          stateOfSheet: 0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: StreamBuilder<String>(
                              stream: signUpBloC.password,
                              builder: (context, snapshot) {
                                return InputFieldArea(
                                  icon: Padding(
                                    padding: const EdgeInsets.only(left: 8.0 , right: 8.0),
                                    child: Icon(Icons.lock_outline, color: Colors.white,),
                                  ),
                                  hint: AppLocalization.of(context).getLocalizedText("password"),
                                  textInputType: TextInputType.text,
                                  show: true,
                                  inputFieldWithBorder: false,
                                  changedFunction: signUpBloC.updatePassword,
                                  errorTxt: snapshot.error,
                                );
                              }),
                        ),
                        InkWell(
                          onTap: () {
                            if(isChecked == false){
                              setState(() {
                                activeColor = Color(lightThemeColors["sign-text"]);
                                isChecked = true ;
                              });
                            }else{
                              setState(() {
                                activeColor = Theme.of(context).primaryColor ;
                                isChecked = false ;
                              });
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left :8.0 , right: 8.0),
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: activeColor,
                                    child: Icon(Icons.done , size: 12, color: Colors.white,),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    AppLocalization.of(context).getLocalizedText("terms"),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Color(lightThemeColors["sign-text"]),
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        CustomButton(
                          onButtonPress: () {
                            if(isChecked){}else{

                              ErrorDialog(
                                context: context ,
                                title: "Please you have to accept the conditions",
                                btnAction: (){
                                  Navigator.pop(context);
                                },
                                buttonText: "OK"
                              );
                            }
                          },
                          text: AppLocalization.of(context)
                              .getLocalizedText("create"),
                        ),
                      ],
                    );
                  }),
              CustomBackArrow(
                top: 30.0,
                left: 20.0,
                onTap: (){
                  NamedNavigatorImpl().pop();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
