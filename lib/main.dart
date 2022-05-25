import 'package:flutter/material.dart';
import 'package:rwcourses/rwcourses_app.dart';
import 'package:rwcourses/state/filter_state_container.dart';
import 'package:rwcourses/strings.dart';

void main() {
  runApp(
    // Wrap the MaterialApp in a FilterStateContainer
    // That puts the FilterStateContainer & the InheritedWidget above the other pages in the widget tree.
    FilterStateContainer(
      child: MaterialApp(
        title: Strings.appTitle,
        theme: ThemeData(primaryColor: Colors.green.shade800),
        home: RWCoursesApp(),
      ),
    ),
  );
}
