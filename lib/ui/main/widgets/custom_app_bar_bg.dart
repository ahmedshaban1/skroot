import 'package:flutter/material.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/ui/main/master_page/brands/internal/products/get_products_bloc.dart';

class CustomAppBarBg extends StatelessWidget {
  final text;

  final openCard;

  final widget ;
  
  final card ;


  const CustomAppBarBg(
      {Key key, this.text, this.openCard, this.widget, this.card = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .08,
      margin: EdgeInsets.only(top: 20, bottom: 5),
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
         InkWell(
                  onTap: (){
                    getProductsBloC.modelIdChanged(null);
                    getProductsBloC.catIdChanged(null);
                    getProductsBloC.brandIdChanged(null);
                    getProductsBloC.yearChanged(null);
                    getProductsBloC.add(Click());
                    NamedNavigatorImpl().pop();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 70,
                    child: Center(
                      child: Icon(
                        Icons.arrow_back,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top :8.0),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.title.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
          card ?? false
          ? InkWell(
                  onTap: openCard,
                  child: Container(
                    width: 70,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.shopping_basket,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ) :Container(
                  width: 70,
                )
        ],
      ),
    );
  }
}
