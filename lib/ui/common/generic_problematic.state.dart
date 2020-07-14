import 'package:flutter/material.dart';

import 'generic_error.dart';

class GenericProblematicState extends StatelessWidget {
  final Function retry;

  GenericProblematicState({@required this.retry});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height,
      child: Center(
        child: GenericError(retry: retry),
      ),
      color: Theme.of(context).backgroundColor,
    );
  }
}
