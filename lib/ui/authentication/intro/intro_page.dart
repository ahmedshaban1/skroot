import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/models/lists/slider_response.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/ui/authentication/intro/intro_bloc.dart';
import 'package:skroot/ui/common/loader.component.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    // TODO: implement initState
    introBloc.add(Hydrate());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          "assets/images/logo.png",
          height: 30,
          width: 80,
        ),
      ),
      body: BlocBuilder(
        bloc: introBloc,
        builder: (context, state) {
          if (state is Start) {
            return Center(
              child: AppLoader(),
            );
          } else {
            var response = state.model as IntroResponse;
            List<PageViewModel> list = [];
            for (int i = 0; i < response.data.length; i++) {
              list.add(PageViewModel(
                  body: response.data[i].contentEn,
                  title: response.data[i].titleEn,
                  decoration: PageDecoration(
                      titleTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                      bodyTextStyle:
                          TextStyle(color: Colors.white, fontSize: 18.0)),
                  image: Image.network(response.data[i].imageUrl)));
            }
            return IntroductionScreen(
                onDone: () {
                  NamedNavigatorImpl().push(Routes.HOME_ROUTER, clean: true);
                },
                showSkipButton: true,
                showNextButton: true,
                done: Text("done", style: TextStyle(color: Colors.white)),
                next: Text("next", style: TextStyle(color: Colors.white)),
                skip: Text("Skip", style: TextStyle(color: Colors.white)),
                pages: list,
                onSkip: () {
                  NamedNavigatorImpl().push(Routes.LOGIN_ROUTER, clean: true);
                },
                dotsDecorator: DotsDecorator(
                    size: const Size.square(10.0),
                    activeSize: const Size(20.0, 10.0),
                    activeColor: Theme.of(context).primaryColor,
                    color: Colors.black26,
                    spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0))));
          }
        },
      ),
    );
  }
}
