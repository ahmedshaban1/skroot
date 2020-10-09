import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skroot/Components/custom_text_container.dart';
import 'package:skroot/Components/image_bg.dart';
import 'package:skroot/Components/inputTextField.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/helpers/localization.dart';
import 'package:skroot/theming/colors.dart';
import 'package:skroot/ui/main/account/contact_us/contact_us_bloc.dart';
import 'package:skroot/ui/main/master_page/get_from_shared_bloc.dart';
import 'package:skroot/ui/main/master_page/widgets/master_bg.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:skroot/ui/common/CustomButton.dart';
import 'package:skroot/ui/common/loading_dialog.dart';
import 'package:skroot/ui/main/widgets/custom_app_bar_bg.dart';



class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {

  @override
  void initState() {
    getFromShared.add(GetShared());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: height*.15 , bottom: 10,),
              child: ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StreamBuilder<String>(
                        stream: contactUsBloC.userName,
                        builder: (context, snapshot) {
                          return InputFieldArea(
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(
                                  right: 8.0, left: 8.0),
                              child: Icon(
                                Icons.person_outline,
                                color: Colors.white,
                              ),
                            ),
                            hint: AppLocalization.of(context)
                                .getLocalizedText("full_name"),
                            errorTxt: snapshot.error,
                            changedFunction: contactUsBloC.userNameChanged,
                            textInputType: TextInputType.text,
                            inputFieldWithBorder: false,

                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0 , right: 8.0 , top: 2.0 , bottom: 2.0),
                    child: StreamBuilder<String>(
                        stream: contactUsBloC.phoneNumber,
                        builder: (context, snapshot) {
                          return Padding(
                            padding: const EdgeInsets.only(top:2.0,bottom: 2.0),
                            child: InputFieldArea(
                              hint: AppLocalization.of(context).getLocalizedText("phone"),
                              suffixIcon: StreamBuilder<String>(
                                  stream: contactUsBloC.phoneController,
                                  builder: (context, snapshot) {
                                    return CountryCodePicker(

                                      padding: EdgeInsets.all(0.0),
                                      textStyle: TextStyle(color: Colors.grey[300]),
                                      showFlag: false,
                                      onChanged: (code) {
                                        FocusScope.of(context).requestFocus(FocusNode());
                                        print("on change ${code.name} ${code.dialCode} ${code.name}");
                                      },
                                      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                      initialSelection: '+971',
                                      favorite: ['+02', 'EG' , '+971',],
                                      comparator: (a, b) => b.name.compareTo(a.name),
                                      //Get the country information relevant to the initial selection
                                      onInit: (code) {
                                        print("on init ${code.name} ${code
                                            .dialCode} ${code.name}");
                                      },
                                    );
                                  }
                              ),
                              errorTxt: snapshot.error,
                              changedFunction: contactUsBloC.updatePhone,
                              textInputType: TextInputType.number,
                            ),
                          );

                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StreamBuilder<String>(
                        stream: contactUsBloC.email,
                        builder: (context, snapshot) {
                          return InputFieldArea(
                            inputFieldWithBorder: false,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(
                                  right: 8.0, left: 8.0),
                              child: Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                            ),
                            hint: AppLocalization.of(context)
                                .getLocalizedText("email"),
                            errorTxt: snapshot.error,
                            changedFunction: contactUsBloC.emailChanged,
                            textInputType: TextInputType.emailAddress,
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StreamBuilder<String>(
                        stream: contactUsBloC.message,
                        builder: (context, snapshot) {
                          return InputFieldArea(
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(
                                  right: 8.0, left: 8.0),
                              child: Icon(
                                Icons.message,
                                color: Colors.white,
                              ),
                            ),
                            hint: AppLocalization.of(context)
                                .getLocalizedText("message"),
                            errorTxt: snapshot.error,
                            changedFunction: contactUsBloC.updateMessage,
                            textInputType: TextInputType.text,
                            inputFieldWithBorder: false,

                          );
                        }),
                  ),

                  CustomButton(
                    snapshot: true,
                    onButtonPress: () {
                      if(
                      contactUsBloC.userNameController.value != null &&
                          contactUsBloC.emailController.value != null &&
                          contactUsBloC.messageController.value != null &&
                          contactUsBloC.phoneController.value != null
                      ){
                        contactUsBloC.add(Click());
                        showLoadingDialog(context);
                      }else{
                        contactUsBloC.validationFields();
                      }

                    },
                    text: AppLocalization.of(context).getLocalizedText("send"),
                  ),



                  
                ],
              ),
            ),
            CustomAppBarBg(
              card: false,
              text: "Help Center",
            ),
          ],
        ));
  }




}
