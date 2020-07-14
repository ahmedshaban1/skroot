import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'loader.component.dart';

class CachedImage extends StatelessWidget {
  final String photoUrl;
  final double loaderDimension;
  final Widget errorWidget;

  CachedImage(
      {@required this.photoUrl, this.loaderDimension = 20.0, this.errorWidget});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: photoUrl,
      alignment: Alignment.center,
      fit: BoxFit.cover,
      errorWidget: (pCntxt, pNdx, error) {
        return errorWidget;
      },
      placeholder: (pCntxt, pNdx) {
        return Container(
          color: Theme.of(pCntxt).canvasColor,
          child: Center(
            child: Container(
                height: loaderDimension,
                width: loaderDimension,
                child: AppLoader()),
          ),
        );
      },
    );
  }
}
