import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:skroot/Components/custom_back_arrow.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/helpers/localization.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/ui/authentication/verification_code/verification_code_bloc.dart';
import 'package:skroot/ui/common/CustomButton.dart';
import 'package:skroot/ui/common/error_dialog.dart';
import 'package:skroot/ui/common/loading_dialog.dart';
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
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * .4,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/verification_bg.png",
                                    ),
                                    fit: BoxFit.fill)),
                            child: Center(child: Icon(Icons.message , size: 70.0,),),
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
                          padding: const EdgeInsets.only(left :50.0 , right: 50.0),
                          child: PinCodeTextField(
                            length: 4,
                            pinTheme: PinTheme(),

                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            textInputType: TextInputType.number,
                            autoFocus: true,
                            onCompleted: (String value) {
                              verificationCodeBloc.updateCode(value);
                            },
                            onSubmitted: (String value) {
                              verificationCodeBloc.updateCode(value);
                            },

                          ),
                        ),
                        CustomButton(
                          onButtonPress: () {
                            if(widget.stateOfCode == "createAccount"){
                              verificationCodeBloc.add(Click());// nd show
                              showLoadingDialog(context);
// Dialog()
                            }
                            else if(widget.stateOfCode.contains("resetPassword")){
                              verificationCodeBloc.add(Add());// nd showDialog()
                              showLoadingDialog(context);

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
