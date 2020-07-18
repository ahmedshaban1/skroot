import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart' as dateFormat;

import 'inputTextField.dart';

class CustomSimpleDialog2 {
  showSuccessDialog(
      {BuildContext context,
        String msg,
        String buttonTxt,
        Color buttonColor,
        Color buttonTxtColor,
        Color headTxtColor,
        Function btnOnPress}) {
    return showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
                opacity: a1.value,
                child: SimpleDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.white,
                    elevation: 3,
                    contentPadding: EdgeInsets.all(5),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          msg,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: headTxtColor,
                              fontFamily: 'cairo',
                              fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                            btnOnPress();
                          },
                          elevation: 3,
                          height: 45,
                          color: buttonColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            buttonTxt,
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'cairo',
                                color: buttonTxtColor),
                          ),
                        ),
                      ),
                    ])),
          );
        },
        transitionDuration: Duration(milliseconds: 300),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        // ignore: missing_return
        pageBuilder: (context, animation1, animation2) {});
  }

  showInputDialog(
      {BuildContext context,
        String msg,
        String buttonTxt,
        Color buttonColor,
        Color buttonTxtColor,
        Color headTxtColor,
        Function btnOnPress,
        bool noteState ,
        Function onClick,}) {
    return showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
                opacity: a1.value,
                child: SimpleDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                  backgroundColor: Colors.white,
                  elevation: 3,
                  contentPadding: EdgeInsets.all(5),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        msg,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: headTxtColor,
                            fontFamily: 'cairo',
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    SizedBox(height: 20,),

//
//                    StreamBuilder<String>(
//                        stream: noteState ? complaintBloC.note : addReminderBloC.note,
//                        builder: (context, snapshot) {
//                          return InputFieldArea(
//                            textInputType: TextInputType.text,
//
//                            changedFunction:  noteState ?complaintBloC.noteChanged :addReminderBloC.noteChanged,
//                          );
//                        }),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                          btnOnPress();
                        },
                        elevation: 3,
                        height: 45,
                        color: buttonColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          buttonTxt,
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'cairo',
                              color: buttonTxtColor),
                        ),
                      ),
                    ),
                  ],
                )),
          );
        },
        transitionDuration: Duration(milliseconds: 300),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        // ignore: missing_return
        pageBuilder: (context, animation1, animation2) {});
  }

  showRateDialog(
      {BuildContext context,
        Color buttonColor,
        String buttonTxt,
        Color buttonTxtColor,
        Function btnOnPress}) {
    return showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
                opacity: a1.value,
                child: Center(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RatingBar(
                          initialRating: 0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (double value) {},
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                            btnOnPress();
                          },
                          elevation: 3,
                          height: 45,
                          color: buttonColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            buttonTxt,
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'cairo',
                                color: buttonTxtColor),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          );
        },
        transitionDuration: Duration(milliseconds: 300),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        // ignore: missing_return
        pageBuilder: (context, animation1, animation2) {});
  }

  showOptionDialog(
      {BuildContext context,
        String msg,
        String buttonTxt,
        Color buttonColor,
        Color buttonTxtColor,
        Color headTxtColor,
        Function btnOnPress,
        Function changed,
        String selectedDepartment}) {
    return showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
                opacity: a1.value,
                child: SimpleDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )),
                  backgroundColor: Colors.white,
                  elevation: 3,
                  contentPadding: EdgeInsets.all(5),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        msg,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: headTxtColor,
                            fontFamily: 'cairo',
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: const Text(
                        'عميل',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'cairo',
                        ),
                      ),
                      leading: Radio(
                        value: '0',
                        groupValue: selectedDepartment,
                        activeColor: Theme.of(context).primaryColor,
                        onChanged: changed,
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        'مقدم خدمة',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'cairo',
                        ),
                      ),
                      leading: Radio(
                          value: '1',
                          groupValue: selectedDepartment,
                          activeColor: Theme.of(context).primaryColor,
                          onChanged: changed),
                    ),
                    Divider(
                      indent: 100,
                      endIndent: 100,
                      color: Color.fromRGBO(39, 183, 191, 1.0),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                          btnOnPress();
                        },
                        elevation: 3,
                        height: 45,
                        color: buttonColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          buttonTxt,
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'cairo',
                              color: buttonTxtColor),
                        ),
                      ),
                    ),
                  ],
                )),
          );
        },
        transitionDuration: Duration(milliseconds: 300),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        // ignore: missing_return
        pageBuilder: (context, animation1, animation2) {});
  }

  showInfoDialog({
    BuildContext context ,
    final model ,
}){
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
                opacity: a1.value,
                child: SimpleDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                  backgroundColor: Colors.white,
                  elevation: 3,
                  children: <Widget>[
                   Container(
                     margin: EdgeInsets.only(bottom: 10.5),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.only(
                          topLeft :Radius.circular(10.0) ,
                          topRight :Radius.circular(10.0) ,
                       ),
                       color: Theme.of(context).primaryColor,
                     ),
                     height: 50,
                     child: Center(
                       child: Text("بيانات العميل" , style: TextStyle(
                         fontSize: 15,
                         color: Colors.white ,
                       ),textAlign: TextAlign.center,),
                     ),
                   ),

                    customLabel(sub : "الاسم" , main: model.name),
                    customLabel(sub : "المشروع الحالي" , main: model.project),
                    customLabel(sub : "الخدمة" , main: model.services),
                    customLabel(sub : "رقم الخدمة" , main: model.ticketNumber),
                    customLabel(sub : "بداية الاستضافة" , main:  dateFormat.DateFormat("yyyy-MM-dd").format(model.startShareDate)),
                    customLabel(sub : "نهاية الاستضافة" , main: dateFormat.DateFormat("yyyy-MM-dd").format(model.endShareDate)),

                  ],
                )),
          );
        },
        transitionDuration: Duration(milliseconds: 300),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        // ignore: missing_return
        pageBuilder: (context, animation1, animation2) {});
  }

  Widget customLabel({String sub , String main}){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Center(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right:8.0),
                  child: Text(sub),
                ) ,
                SizedBox( width:  10,),
                Text(":"),
                SizedBox( width:  10,),
                Expanded(
                  child: Text(main , style: TextStyle(fontWeight: FontWeight.bold , fontSize: main.length > 20 ? 13: 15),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

