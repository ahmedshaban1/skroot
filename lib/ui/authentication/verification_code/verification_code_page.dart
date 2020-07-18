import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skroot/Components/custom_back_arrow.dart';
import 'package:skroot/helpers/localization.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/ui/authentication/verification_code/verification_code_bloc.dart';
import 'package:skroot/ui/common/CustomButton.dart';
import 'package:skroot/ui/common/error_dialog.dart';
class VerificationCodePage extends StatefulWidget {
  final String stateOfCode ;

  const VerificationCodePage({Key key, this.stateOfCode}) : super(key: key);
  @override
  _VerificationCodePageState createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
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
          bloc: verificationCodeBloc,
          child: Stack(
            children: <Widget>[
              BlocBuilder(
                  bloc: verificationCodeBloc,
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


                        CustomButton(
                          onButtonPress: () {

                            if(widget.stateOfCode == "createAccount"){

                            }else if(widget.stateOfCode.contains("resetPassword")){
                              var mNamedNavigator = NamedNavigatorImpl();
                              mNamedNavigator.push(Routes.RESET_PASSWORD,
                                  arguments: "", replace: false, clean: false);
                            }else{
                              // Change Password

                            }
//                            if(null){}else{
//
//                              ErrorDialog(
//                                  context: context ,
//                                  title: "Please you have to accept the conditions",
//                                  btnAction: (){
//                                    Navigator.pop(context);
//                                  },
//                                  buttonText: "OK"
//                              );
//                            }
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
