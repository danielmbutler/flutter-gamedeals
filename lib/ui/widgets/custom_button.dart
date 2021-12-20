
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Function buttonHandler;
  final String btnText;
  final IconData icon;
  final Color color;
  final String? updateText;

  CustomButton(this.buttonHandler, this.btnText, this.icon, this.color, this.updateText);

  @override
  _CustomButtonState createState() => _CustomButtonState(buttonHandler, btnText, icon, color, updateText);

}

class _CustomButtonState extends State<CustomButton> {
  final Function buttonHandler;
  final String initialText;
  final IconData iconData;
  final Color color;
  final String? updateText;
  var btnText = "";

  _CustomButtonState(this.buttonHandler, this.initialText, this.iconData, this.color, this.updateText){
    btnText = initialText;
  }


  @override
  Widget build(BuildContext context) {
   return ElevatedButton(
      style:  ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(color)),
      onPressed: () {
        buttonHandler();
        if(updateText != null){
          btnText = updateText!;
        }
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

