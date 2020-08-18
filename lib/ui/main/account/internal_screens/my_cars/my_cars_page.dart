import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/models/my_cars/my_cars_response.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
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
      floatingActionButton: RaisedButton(
        onPressed: () async {
          var result =await NamedNavigatorImpl().push(Routes.ADD_CAR_TOUTER);
          if(result == true){
            myCarsBloc.add(Hydrate());
          }
        },
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        child: Container(

          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Colors.purple,
                Colors.purpleAccent,
                Colors.deepPurple,
              ],
            ),
          ),
          padding: const EdgeInsets.all(10.0),
          child: const Text('Add New  Car', textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
        ),
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
