import 'package:skroot/theming/build_theme_data.dart';
import 'package:skroot/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'helpers/localization.dart';
import 'navigator/named-navigator.dart';
import 'navigator/named-navigator_impl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Skroot());
}


class Skroot extends StatefulWidget{

  @override
  State<StatefulWidget> createState()  =>SkrootState();
}



class SkrootState extends State<Skroot>{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skroot',
      initialRoute: Routes.SPLASH_ROUTER,
      onGenerateRoute: NamedNavigatorImpl.onGenerateRoute,
      navigatorKey: NamedNavigatorImpl.navigatorState,
//      builder: (context ,widget){
//        return buildThemeData(context ,widget);
//      },
      debugShowCheckedModeBanner: false,
      supportedLocales: [
        const Locale('en', ''), // English
      ],
      localizationsDelegates: [
        AppLocalizationDelegate(
          localizationPath: "assets/localization/",
          supportedLanguages: ['en'],
        ),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }


}







