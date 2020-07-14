import 'package:flutter/material.dart';

class CustomTabIndicator extends Decoration {
  final BoxPainter _painter;

  CustomTabIndicator({@required Color color})
      : _painter = CustomTabBarIndicator(color);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class CustomTabBarIndicator extends BoxPainter {
  Paint _paint;
  Paint _linePaint;

  CustomTabBarIndicator(Color color) {
    _paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    _linePaint = Paint()
      ..color = color
      ..strokeWidth = 3;
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset triangleOffset =
        offset + Offset(cfg.size.width / 2, cfg.size.height + 7);

    final Offset lineStartOffset = offset + Offset(0, cfg.size.height - 1);
    final Offset lineEndOffset =
        offset + Offset(cfg.size.width, cfg.size.height - 1);

    var path = Path();

    path.moveTo(triangleOffset.dx, triangleOffset.dy);
    path.lineTo(triangleOffset.dx + 7, triangleOffset.dy - 7);
    path.lineTo(triangleOffset.dx - 7, triangleOffset.dy - 7);

    path.close();

    canvas.drawPath(path, _paint);
    canvas.drawLine(lineStartOffset, lineEndOffset, _linePaint);
  }
}
