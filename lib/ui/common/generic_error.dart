import 'package:flutter/material.dart';

class GenericError extends StatelessWidget {
  final Function retry;

  GenericError({@required this.retry});

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsetsDirectional.only(bottom: 13),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/splash.jpg"),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 6),
                child: Text(
                  "نأسف حدث خطأ ما",
                  style: Theme.of(context).textTheme.subhead.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 34.0 / 375 * _screenSize.width),
          child: Text(
            "وصف المشكلة",
            style: Theme.of(context).textTheme.body1.copyWith(
                  fontWeight: FontWeight.normal,
                ),
            textAlign: TextAlign.center,
          ),
        ),
        _drawTryAgainButton(_screenSize, context),
      ],
    );
  }

  Widget _drawTryAgainButton(screenSize, BuildContext context) {
    if (retry == null) {
      return Container();
    }
    return Container(
      alignment: Alignment.center,
      width: .72 * screenSize.width,
      height: 48,
      margin: EdgeInsets.only(top: 14),
      child: FlatButton(
        onPressed: retry,
        child: Center(
          child: Text(
            "حاول مرة اخري",
            style: Theme.of(context).textTheme.subhead.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}
