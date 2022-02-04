import 'package:flutter/material.dart';
import 'package:rwcourses/strings.dart';

import '../../constants.dart';
import 'filter_widget.dart';

// NOTE: For a StatefulWidget, we need to override createState()
class FilterPage extends StatefulWidget {
@override
  State<StatefulWidget> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {

  // Property to hold the currently selected filter value.
  int _filterValue = Constants.allFilter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.filter),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          FilterWidget(
              value: Constants.iosFilter,
              groupValue: _filterValue,
              onChanged: _handleRadioValueChange,
              text: Strings.ios,
          ),
          FilterWidget(
            value: Constants.androidFilter,
            groupValue: _filterValue,
            onChanged: _handleRadioValueChange,
            text: Strings.android,
          ),
          FilterWidget(
            value: Constants.flutterFilter,
            groupValue: _filterValue,
            onChanged: _handleRadioValueChange,
            text: Strings.flutter,
          ),
          FilterWidget(
            value: Constants.sssFilter,
            groupValue: _filterValue,
            onChanged: _handleRadioValueChange,
            text: Strings.sss,
          ),
          FilterWidget(
            value: Constants.unityFilter,
            groupValue: _filterValue,
            onChanged: _handleRadioValueChange,
            text: Strings.unity,
          ),
          FilterWidget(
            value: Constants.macosFilter,
            groupValue: _filterValue,
            onChanged: _handleRadioValueChange,
            text: Strings.macos,
          ),
          FilterWidget(
            value: Constants.allFilter,
            groupValue: _filterValue,
            onChanged: _handleRadioValueChange,
            text: Strings.all,
          ),
        ],
      ),
    );
  }

  // A private message that will be called when the selected filter changes.
  // Call setState() to update the state of the filter page filter value.
  // If there's a null value, you set the filter value to zero.
  // TODO: Update to (int? value)
  void _handleRadioValueChange(int value) {
    setState(() {
      _filterValue = value ?? 0;
    });
  }
}