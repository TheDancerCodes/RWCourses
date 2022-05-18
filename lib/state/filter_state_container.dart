// The FilterStateContainer class is a StatefulWidget

import 'package:flutter/material.dart';
import 'package:rwcourses/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilterStateContainer extends StatefulWidget {

  // Add child widget property along with the constructor
  final Widget child;

  // As a Stateful widget, we pass a key to the constructor along with the child required property
  const FilterStateContainer({
    Key key,
    @required this.child,
  }) : super(key: key);

  // Override createState
  @override
  State<StatefulWidget> createState() => FilterState();

  // Static method that uses the other pattern to return 
  //the FilterState contained inside the StatefulWidget

  // SOLUTION: Calling dependOnInheritedWidgetOfExactType() on the context & that method is typed by 
  // a _FilterInheritedWidget.
  // By calling that method on the context, we're gonna return the closest InheritedWidget in 
  // the widget tree that returns a FilterState.
  static FilterState of(BuildContext context) {
    return context
    .dependOnInheritedWidgetOfExactType<_FilterInheritedWidget>()
    .state;
  }

}

// Add the FilterState class for FilterStateContainer
// NOTE: Unlike most of our other StatefulWidgets, the FilterState class is public 
// because we will need to access it from other parts of the app
class FilterState extends State<FilterStateContainer> {

  // int property(public) & shared preferences property(private)
  int filterValue = Constants.allFilter;
  SharedPreferences _prefs;

  // Call to initState
  @override
  void initState() {
    super.initState();

    _loadValue();
  }


  // _loadValue() method to read the filterValue out of SharedPreferences

  // SOLUTION: We're using the `then` syntax for handling a future; inside `then` we are setting the 
  // prefs value and calling setState() on FilterState to update the filterValue, value.
  // We are using the value that's stored inside of SharedPreferences for the FilterKey
  _loadValue() {
    SharedPreferences.getInstance().then((value) {
      _prefs = value;
      setState(() {
        filterValue = _prefs.getInt(Constants.filterKey);
      });
    });
  }

  // updateFilterValue() method that will be used to update the state filter from the filter page
  // SOLUTION: We are calling setState() on FilterState, saving the new filterValue into the 
  // filterValue property & also updating SharedPreferences with the most recently chosen filterValue.
  void updateFilterValue(int value) {
    setState(() {
      _prefs.setInt(Constants.filterKey, value);
      filterValue = value;
    });
  }

  // The necessary build method on FilterState that returns an InheritedFilterWidget
  // SOLUTION: The state we pass to the FilterInheritedWidget constructor is 
  // the current FilterState instance & the child is the same child as that for the FilterStateContainer
  @override
  Widget build(BuildContext context) {
    return _FilterInheritedWidget(
      state: this,
      child: widget.child,
    ); 
  }
}

// InheritedWidget Class - A private class
class _FilterInheritedWidget extends InheritedWidget {
  // Will have a  & also needs 
  // and a child for the InheritedWidget
  
  // FilterState property
  final FilterState state;

  // A constructor that populates the state
  // We pass both the key and the child to the super constructor
  _FilterInheritedWidget({
    Key key,
    @required this.state,
    @required Widget child,
  }) : super(key: key, child: child);

  // Override the updateShouldNotify() method on the InheritedWidget
  // SOLUTION: By returing true from this method, we are saying that all widgets that depend on this 
  // InheritedWidget should rebuild when the state of the InheritedWidget changes.
  @override
  bool updateShouldNotify(_FilterInheritedWidget oldWidget) => true;
}

