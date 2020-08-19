import 'dart:async';

import 'localization.dart';
class Validator{

  var emailValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (email, sink){
      if (email.contains("@")){
//          !RegExp(r"[a-z0-9!#$%&'+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'+/=?^_`{|}~-]+)@(?:[a-z0-9](?:[a-z0-9-][a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
//              .hasMatch(email)) {
//        sink.add(email);
      sink.add(email);
      }
      else{
        sink.addError('please enter valid email');
      }
    }
  );
  var nameValidator = StreamTransformer<String,String>.fromHandlers(
      handleData: (name , sink){
        if(name.length > 6){
          sink.add(name);
        }else{
          sink.addError('please enter valid name');
        }
      }
  );

  var addressValidator = StreamTransformer<String,String>.fromHandlers(
      handleData: (name , sink){
        if(name.length > 4){
          sink.add(name);
        }else{
          sink.addError('اكتب العنوان كامل');
        }
      }
  );

  var descriptionValidator = StreamTransformer<String,String>.fromHandlers(
      handleData: (name , sink){
        if(name.length > 10){
          sink.add(name);
        }else{
          sink.addError('يجب ان يكون عدد الحروف للوصف يزيد عن 10 حروف');
        }
      }
  );

  var aboutGroupValidator = StreamTransformer<String,String>.fromHandlers(
      handleData: (name , sink){
        if(name.length > 10){
          sink.add(name);
        }else{
          sink.addError('يجب ان يكون عدد الحروف لتعريف المجموعه يزيد عن 10 حروف');
        }
      }
  );

  var number = StreamTransformer<String,String>.fromHandlers(
      handleData: (num , sink){
        if(num.length > 8){
          sink.add(num);
        }else{
          sink.addError("Enter a valid phone number");
        }
      }
  );

  var selectedId = StreamTransformer<int,int>.fromHandlers(
      handleData: (id , sink){
        if(id != null || id != 0) {
          sink.add(id);
        } else {
          sink.addError("Select Valid ID");
        }
      }
  );

  var numberOfPeopleValidator = StreamTransformer<String,String>.fromHandlers(
      handleData: (num , sink){
        if(num.length == 0){
          sink.add(num);
        }else{
          sink.addError('العدد يجيب علي الاقل 1');
        }
      }
  );  var cost = StreamTransformer<String,String>.fromHandlers(
      handleData: (num , sink){
        if(num.length == 0){
          sink.add(num);
        }else{
          sink.addError('');
        }
      }
  );



  var passwordValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (password , sink){
      if(password.length >= 6){
        sink.add(password);
      }else{
        sink.addError('Password must be at least 6 character');
      }
    }
  );

  var noThing = StreamTransformer<String,String>.fromHandlers(
      handleData: (num , sink){
          sink.add(num);
      }
  );

  var noThingBool = StreamTransformer<bool,bool>.fromHandlers(
      handleData: (num , sink){
        sink.add(num);
      }
  );

  var linkValidator = StreamTransformer<String,String>.fromHandlers(
      handleData: (link , sink){
        if(link.contains("http")){
          sink.add(link);
        }else{
          sink.addError('يجب ان تقوم بادخال لينك بصيغة http');
        }
      }
  );

  var test = StreamTransformer<int,int>.fromHandlers(
      handleData: (num , sink){
        if(num > 0){
          sink.add(num);
        }else{
          sink.addError('ادخل رقم اكبر من الصفر');
        }
      }
  );

  var confirmPassWordValidator = StreamTransformer<String,String>.fromHandlers(
      handleData: (password , sink){
        if(password.length > 6 ){
          sink.add(password);
        }else{
          sink.addError('');
        }
      }
  );




}