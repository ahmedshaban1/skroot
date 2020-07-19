import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skroot/Components/inputTextField.dart';
import 'package:skroot/helpers/localization.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/ui/authentication/enter_phone_number/enter_phone_number_bloc.dart';
import 'package:skroot/ui/common/CustomButton.dart';
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
        child: Form(
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
                                changedFunction: enterPhoneNumberBloc.updatePhone,
                                textInputType: TextInputType.number,
                              );
                            }),
                      ),
                      CustomButton(
                        onButtonPress: () {
                          NamedNavigatorImpl().push(Routes.SEND_CODE , clean:  false , replace:  false , arguments:  "resetPassword");
                        },
                        text: AppLocalization.of(context)
                            .getLocalizedText("confirm"),
                      ),

                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
