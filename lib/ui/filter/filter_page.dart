import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  // Add initState to call to loadValue
  // Calling the new loadValue() function from the initState() override for _FilterPageState
  // SOLUTION: This lets is retrieve the currently saved filterValue that is in SharedPreferences
  @override
  void initState() {
    super.initState();
    _loadValue();
  }

    // Helper Method - to load the currently saved filter value when the
  // FilterPage is first opened
  // NOTE: The call to getInstance is asynchronous, we will use the
  // async/await keywords
  void _loadValue() async {
    final prefs = await SharedPreferences.getInstance();

    // Call setState and set the filterValue for the FilterPage.
    // We will set it using the current value for the filter that is stored in
    // SharedPreferences.
    // SOLUTION: We are calling getInt() on prefs, which is going to return an integer from 
    // SharedPreferences & we are passing in a key that the sharedPref for the filterValue is going 
    // to be saved under.
    setState(() {
      _filterValue = prefs.getInt(Constants.filterKey) ?? 0;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
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
       )
     );
   }

  // A private message that will be called when the selected filter changes.
  // Call setState() to update the state of the filter page filter value.
  // If there's a null value, you set the filter value to zero.
  // Save the filter selected by a user using SharedPreferences.
  // TODO: Update to (int? value)
  void _handleRadioValueChange(int value) async {

    // Get the SharedPreferences instance
    final prefs = await SharedPreferences.getInstance();

    setState(() {  // set the filterValue
      _filterValue = value ?? 0;

      // Save the currently selected value into SharedPreferences using setInt
      // SOLUTION: We call setInt() on prefs, we pass in the same key we are going to use to retrieve 
      // the filter value & we pass in the currently selected filterValue.
      prefs.setInt(Constants.filterKey, _filterValue);
    });
  }
}