import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:skroot/Components/custom_swiper.dart';
import 'package:skroot/Components/image_bg.dart';
import 'package:skroot/theming/colors.dart';
import 'package:skroot/ui/common/CustomButton.dart';
import 'package:skroot/ui/main/widgets/custom_app_bar_bg.dart';
import 'widgets/description_text.dart';

class ProductDetails extends StatefulWidget {
  final model ;

  const ProductDetails({Key key, this.model}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
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
                top: height * .08,
                bottom: 10,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left :12.0 , right: 12.0),

                child: ListView(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.model.name.en,
                          style: Theme.of(context).textTheme.title,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    Container(
                      height: 200,
                      child: CustomSwiper(
                        model: [
                          widget.model.partCategory.imageUrl,
                          widget.model.partCategory.imageUrl,
                          widget.model.partCategory.imageUrl,
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CustomDescriptionText(txt: widget.model.carBrand.name.en,type: "Brand",),
                            SizedBox(width: 30,),
                            CustomDescriptionText(txt: widget.model.carBrandModel.name.en,type: "Model",),
                          ],
                        ),
                        CustomDescriptionText(type: "Year",txt: widget.model.year.toString(),),
                        CustomDescriptionText(type: "Chases Number",txt: "65656",),
                        Row(
                          children: <Widget>[
                            CustomDescriptionText(txt: widget.model.partCategory.name.en,type: "Type",),
                            SizedBox(width: 50,),
                            CustomDescriptionText(txt: widget.model.price.toString(),type: "price",),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      "Descriptions",
                      style: Theme.of(context).textTheme.title.copyWith(
                        fontSize: 18
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        RatingBar(
                          initialRating: 3,
                          minRating: 1,
                          itemSize: 15.0,
                          ignoreGestures: true,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          unratedColor: Colors.grey,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (double value) {},
                        ),
                        Text(
                          "4.0",
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "(36 reviews)",
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    Text(
                      widget.model.description.en,
                      textAlign: TextAlign.start,
                      maxLines: 100,
                    ),

                    CustomButton(
                      onButtonPress: () {
                      },
                      text: "Add to cart",
                    )
                  ],
                ),
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
