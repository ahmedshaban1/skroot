import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'package:skroot/Components/custom_back_arrow.dart';
import 'package:skroot/Components/inputTextField.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/helpers/localization.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/theming/colors.dart';
import 'package:skroot/ui/authentication/enter_phone_number/enter_phone_number_bloc.dart';
import 'package:skroot/ui/common/CustomButton.dart';
import 'package:skroot/ui/common/error_dialog.dart';
import 'package:skroot/ui/common/loading_dialog.dart';
class EnterPhoneNumber extends StatefulWidget {
  @override
  _EnterPhoneNumberState createState() => _EnterPhoneNumberState();
}

class _EnterPhoneNumberState extends State<EnterPhoneNumber> {
  GlobalKey<FormState> form_key = GlobalKey();
  final _blank = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(_blank);
        },
        child: Stack(
          children: <Widget>[
            Form(
              key: form_key,
              child: BlocListener(
                listener: (context, state) {},
                bloc: enterPhoneNumberBloc,
                child: BlocBuilder(
                    bloc: enterPhoneNumberBloc,
                    builder: (context, state) {
                      return ListView(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * .6,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "assets/images/login_bg.png",
                                      ),
                                      fit: BoxFit.fill)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    AppLocalization.of(context)
                                        .getLocalizedText("forget-password"),
                                    style: Theme.of(context).textTheme.title,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width * .8,
                                    child: Text(
                                      AppLocalization.of(context)
                                          .getLocalizedText("sub-forget"),
                                      style: Theme.of(context).textTheme.display1,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: StreamBuilder<String>(
                                stream: enterPhoneNumberBloc.phoneNumber,
                                builder: (context, snapshot) {
                                  return Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        color: Color(lightThemeColors['sign-bg'])),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InternationalPhoneInput(
                                        initialSelection:"+971" ,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            fillColor: Color(lightThemeColors['sign-bg']),
                                            hintText: AppLocalization.of(context)
                                                .getLocalizedText("phone"),
                                            errorText: snapshot.error,
                                            errorStyle:  const TextStyle(
                                                color: Colors.red,
                                                fontSize: 15.0,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'cairo'),
                                            hintStyle: const TextStyle(
                                                color: Color(0xff707070),
                                                fontSize: 15.0,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'cairo')
                                        ),
                                        errorText: snapshot.error,
                                        onPhoneNumberChange:(x,y,z) =>enterPhoneNumberBloc.updatePhone(x),
                                        showCountryCodes: true,
                                        showCountryFlags: false,

//                              border: InputBorder(borderSide: BorderSide(color: Colors.black87)),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          CustomButton(
                            onButtonPress: () {
                              if(enterPhoneNumberBloc.phoneController.value != null){
                                enterPhoneNumberBloc.add(Click());
                                showLoadingDialog(context);
                              }else{
                                ErrorDialog(
                                    context: context,
                                    title: "Please you have to enter the phone number",
                                    btnAction: () {
                                      Navigator.pop(context);
                                    },
                                    buttonText: "OK");
                              }

                            },
                            text: AppLocalization.of(context)
                                .getLocalizedText("confirm"),
                          ),

                        ],
                      );
                    }),
              ),
            ),
            CustomBackArrow(
              top: 30.0,
              left: 20.0,
              onTap: () {
                NamedNavigatorImpl().pop();
              },
            )

          ],
        ),
      ),
    );
  }
}
