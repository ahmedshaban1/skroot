import 'package:flutter/material.dart';
import 'package:skroot/theming/colors.dart';


class CustomButton extends StatelessWidget {
  final double width, higth, opacity ,raduis;
  final String text;
  final Function onButtonPress;

  const CustomButton({Key key, this.width, this.higth, this.text, this.opacity, this.raduis, this.onButtonPress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onButtonPress,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [  Color(0xffA750D2) ,Color(0xff2C066E) ]
            ),
              borderRadius: BorderRadius.circular(raduis??10)),
          width: width ?? 140,
          height: higth ?? 55,
          child: Center(
            child: Text(
              text ?? "",
              style: TextStyle(
                  color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}


