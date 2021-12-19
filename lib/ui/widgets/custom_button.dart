
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Function buttonHandler;
  final String btnText;
  final IconData icon;
  final Color color;

  CustomButton(this.buttonHandler, this.btnText, this.icon, this.color);

  @override
  _CustomButtonState createState() => _CustomButtonState(buttonHandler, btnText, icon, color);

}

class _CustomButtonState extends State<CustomButton> {
  final Function buttonHandler;
  final String btnText;
  final IconData iconData;
  final Color color;

  _CustomButtonState(this.buttonHandler, this.btnText, this.iconData, this.color);

  @override
  Widget build(BuildContext context) {
   return ElevatedButton(
      style:  ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(color)),
      onPressed: () {
        buttonHandler();
        setState(() {});
      },
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(btnText),
          Icon(iconData),
        ],
      ),
    );
  }

}

