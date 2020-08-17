import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/models/my_cars/my_cars_response.dart';
import 'package:skroot/ui/main/account/internal_screens/my_cars/components/my_cars_view.dart';
import 'package:skroot/ui/main/account/internal_screens/my_cars/my_cars_bloc.dart';

class MyCarsPage extends StatefulWidget {
  @override
  _MyCarsPageState createState() => _MyCarsPageState();
}

class _MyCarsPageState extends State<MyCarsPage> {
  @override
  void initState() {
    myCarsBloc.add(Hydrate());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My cars"),
      ),
      body: BlocBuilder(
        bloc: myCarsBloc,
        builder: (context, state) {
          var data = state.model as MyCarsResponse;
          return MyCarsView(
            data: data,
          );
        },
      ),
    );
  }
}
