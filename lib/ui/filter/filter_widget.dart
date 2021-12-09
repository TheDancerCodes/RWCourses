import 'package:flutter/material.dart';

  /*
   Properties of the Widget:

   A value
   A group value that tells the radio buttons which value to match with
   A valueChanged callbakc - called when a radio button is selected
   A text string to show along with the radio button
   */
class FilterWidget extends StatelessWidget {

  final int value;
  final int groupValue;
  final ValueChanged<int> onChanged;
  final String text;

  // Constructor
  // NOTE: As a stateless widget, we pass the key to teh constructor and 
  // then we made all of the other properties be 'required'.
  FilterWidget(
    {Key key,
    @required this.value,
    @required this.groupValue,
    @required this.onChanged,
    @required this.text})
    : super(key: key);

    /*
     Add build method for the FilterPage & its gonna show a radio button and a text widget in a row.

     NOTE: The value, group value, and onChanged value callback are passed along to the radio widget 
     and the text is displayed in a text widget.

     */
    @override
    Widget build(BuildContext context) {
      return Row(
        children: [
          Radio(
            value: value, 
            groupValue: groupValue, 
            onChanged: onChanged
          ),
          Text(
            text,
            style: TextStyle(fontSize: 16.0),
          )
        ],
      );
    }

}