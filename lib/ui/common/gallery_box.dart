import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class GalleryBox extends StatefulWidget {
  final List<NetworkImage> _photoURLs;
  final BuildContext _themeContext;
  final int _selected;
  final Function _onSelectedChanged;

  GalleryBox(
      {@required List<NetworkImage> photoURLs,
      @required BuildContext themeContext,
      @required Function onSelectedChanged,
      int selected = 0})
      : _photoURLs = photoURLs,
        _themeContext = themeContext,
        _onSelectedChanged = onSelectedChanged,
        _selected = selected;

  @override
  _GalleryBoxState createState() => _GalleryBoxState();
}

class _GalleryBoxState extends State<GalleryBox> with TickerProviderStateMixin {
  int _currentPhotoIndex;
  AnimationController _colorController;
  Animation<Color> _color;
  AnimationController _opacityController;
  Animation<double> _opacity;
  PageController _pageController;

  @override
  void initState() {
    _currentPhotoIndex = widget._selected;
    _pageController = PageController(initialPage: widget._selected);
    _colorController =
        AnimationController(duration: Duration(milliseconds: 1500), vsync: this)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _colorController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _colorController.forward();
            }
          });

    _color = ColorTween(
            begin: Theme.of(widget._themeContext)
                .textTheme
                .body1
                .color
                .withOpacity(0.10),
            end: Theme.of(widget._themeContext)
                .textTheme
                .body1
                .color
                .withOpacity(0.38))
        .animate(_colorController);
    _colorController.forward();

    _opacityController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _opacity =
        CurvedAnimation(parent: _opacityController, curve: Curves.easeInOut);
    _opacityController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _colorController.dispose();
    _opacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (widget._photoURLs == null || widget._photoURLs.isEmpty)
        ? _drawSkeleton()
        : _drawGallery();
  }

  // UI Builder
  Widget _drawSkeleton() {
    return AnimatedBuilder(
        animation: _colorController,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).scaffoldBackgroundColor,
                    BlendMode.saturation,
                  ),
                  child: Container(color: _color.value)),
              Image.asset(
                "assets/splash.jpg",
                color: Theme.of(context).primaryColor,
              ),
            ],
          );
        });
  }

  Widget _drawGallery() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width,
      child: Carousel(
        autoplay: true,
        autoplayDuration: Duration(seconds: 3),
        dotColor: Theme.of(context).primaryColor,
        dotBgColor: Colors.transparent,
        dotSize: 4.0,
        indicatorBgPadding: 4,
        images: widget._photoURLs,
        onImageTap: widget._onSelectedChanged,
      ),
    );
  }




  // UI Event
//  void _onPhotoChanged(int newPhotoIndex) {
//    setState(() {
//      _currentPhotoIndex = newPhotoIndex;
//      widget._onSelectedChanged(_currentPhotoIndex);
//    });
//
//    widget._onSelectedChanged(newPhotoIndex);
//  }
}
