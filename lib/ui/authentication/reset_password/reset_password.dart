import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skroot/Components/custom_back_arrow.dart';
import 'package:skroot/Components/inputTextField.dart';
import 'package:skroot/helpers/localization.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/theming/colors.dart';
import 'package:skroot/ui/authentication/reset_password/reset_password_bloc.dart';
import 'package:skroot/ui/common/CustomButton.dart';
class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
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
                bloc: resetPasswordBloc,
                child: BlocBuilder(
                    bloc: resetPasswordBloc,
                    builder: (context, state) {
                      return ListView(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * .7,
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
                                        .getLocalizedText("reset-password"),
                                    style: Theme.of(context).textTheme.title,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width * .8,
                                    child: Text(
                                      AppLocalization.of(context)
                                          .getLocalizedText("sub-reset"),
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
                                stream: resetPasswordBloc.password,
                                builder: (context, snapshot) {
                                  return InputFieldArea(
                                    icon: Padding(
                                      padding: const EdgeInsets.only(right:8.0 , left: 8.0),
                                      child: Icon(
                                        Icons.lock_outline,
                                        color: Colors.white,
                                      ),
                                    ),
                                    hint: AppLocalization.of(context)
                                        .getLocalizedText("password"),
                                    errorTxt: snapshot.error,
                                    changedFunction: resetPasswordBloc.updatePassword,
                                    textInputType: TextInputType.number,
                                  );
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: StreamBuilder<String>(
                                stream: resetPasswordBloc.confirmPassword,
                                builder: (context, snapshot) {
                                  return InputFieldArea(
                                    icon: Padding(
                                      padding: const EdgeInsets.only(left: 8.0 , right: 8.0),
                                      child: Icon(Icons.lock_outline, color: Colors.white,),
                                    ),
                                    hint: AppLocalization.of(context).getLocalizedText("re-password"),
                                    textInputType: TextInputType.text,
                                    show: true,
                                    inputFieldWithBorder: false,
                                    changedFunction: resetPasswordBloc.updateConfirmPass,
                                    errorTxt: snapshot.error,
                                  );
                                }),
                          ),
                          CustomButton(
                            onButtonPress: () {},
                            text: AppLocalization.of(context)
                                .getLocalizedText("re-set"),
                          ),
                          SizedBox(height: 10.0,),
                        ],
                      );
                    }),
              ),
            ),
            CustomBackArrow(
              onTap: (){
                NamedNavigatorImpl().pop();
              },
              left: 20.0,
              top: 40.0,
            ),
          ],
        ),
      ),
    );
  }
}

