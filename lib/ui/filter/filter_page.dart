import 'package:flutter/material.dart';
import 'package:rwcourses/state/filter_state_container.dart';
import 'package:rwcourses/strings.dart';

import '../../constants.dart';
import 'filter_widget.dart';

// NOTE: For a StatefulWidget, we need to override createState()
class FilterPage extends StatefulWidget {
@override
  State<StatefulWidget> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {

  // Instance of FilterState class to hold the currently selected filter value.
  FilterState state;

  // To set the value of the state property, add this method override
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    // By setting the state property to the FilterStateContainer value, whenever the inherited widget 
    // is updated, so long as its updateShouldNotify() returns true, the state property of the FilterPageState 
    // will be updated as well & the page will be rebuilt.
    state = FilterStateContainer.of(context);
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
                groupValue: state.filterValue,
                onChanged: _handleRadioValueChange,
                text: Strings.ios,
              ),
              FilterWidget(
                value: Constants.androidFilter,
                groupValue: state.filterValue,
                onChanged: _handleRadioValueChange,
                text: Strings.android,
              ),
              FilterWidget(
                value: Constants.flutterFilter,
                groupValue: state.filterValue,
                onChanged: _handleRadioValueChange,
                text: Strings.flutter,
              ),
              FilterWidget(
                value: Constants.sssFilter,
                groupValue: state.filterValue,
                onChanged: _handleRadioValueChange,
                text: Strings.sss,
              ),
              FilterWidget(
                value: Constants.unityFilter,
                groupValue: state.filterValue,
                onChanged: _handleRadioValueChange,
                text: Strings.unity,
              ),
              FilterWidget(
                value: Constants.macosFilter,
                groupValue: state.filterValue,
                onChanged: _handleRadioValueChange,
                text: Strings.macos,
              ),
              FilterWidget(
                value: Constants.allFilter,
                groupValue: state.filterValue,
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
    state.updateFilterValue(value);
  }
}