import 'package:flutter/material.dart';

class newButton extends StatelessWidget {
  const newButton({
    this.pressed,
    // this.widthSize,
    // this.heightSize,
    this.color,
    this.text,
    Key key,
  }) : super(key: key);

  final String text;
  final Color color;
  // final double widthSize;
  // final double heightSize;
  final void Function() pressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: pressed,
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.24,
              vertical: MediaQuery.of(context).size.height * 0.01),
          child: Text(
            text,
            style: TextStyle(fontSize: 25),
          )),
    );
  }
}
