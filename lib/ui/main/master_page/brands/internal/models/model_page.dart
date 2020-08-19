import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skroot/Components/error_message.dart';
import 'package:skroot/Components/image_bg.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/models/cars/model/brand_model_response.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/theming/colors.dart';
import 'package:skroot/ui/common/loader.component.dart';
import 'package:skroot/ui/main/master_page/brands/internal/models/widgets/model_card.dart';
import 'package:skroot/ui/main/master_page/brands/internal/products/body_product_model.dart';
import 'package:skroot/ui/main/widgets/custom_app_bar_bg.dart';
import 'package:skroot/ui/main/widgets/custom_flitter.dart';

import 'get_brand_model_bloc.dart';

class ModelPage extends StatefulWidget {
  final model ;

  const ModelPage({Key key, this.model}) : super(key: key);
  @override
  _ModelPageState createState() => _ModelPageState();
}

class _ModelPageState extends State<ModelPage> {
  @override
  void initState() {
    getBrandModelBloC.idChanged(widget.model.id);
    getBrandModelBloC.add(Click());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(lightThemeColors["sign-bg"]),
        body: Stack(
          children: <Widget>[
            ImageBG(),
            Container(
              padding: EdgeInsets.only(
                top: height * .1,
              ),
              child: BlocBuilder(
                bloc: getBrandModelBloC,
                builder: (_, state) {
                  if (state is Done) {
                    var model = state.model as BrandsModelResponse;
                    return model.data.length == 0 ?  ErrorMessage(text: "no Date",) : ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: model.data.length,
                        itemBuilder: (_, index) => ModelCard(
                          model: model.data[index],
                          onTap: () {
                              NamedNavigatorImpl().push(Routes.PARTS , arguments:
                              BodyProductModel(
                                carBrandId: widget.model.id,
                                carBrandModelId: model.data[index].id
                              ));
                          },
                        ));
                  } else {
                    return Center(
                        child: Container(
                            padding: EdgeInsets.only(top: height * .03),
                            child: AppLoader()));
                  }
                },
              ),
            ),
            Column(
              children: <Widget>[
                CustomAppBarBg(
                  text: widget.model.name.en,
                ),
              ],
            )
          ],
        ));
  }
}
