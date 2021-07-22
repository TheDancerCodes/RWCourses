// Capture the domain type as an enum
import '../strings.dart';

enum Domain { all, ios, android, flutter, sss, unity, macos, archived, unknown }

// An extension that takes a domain and turns it into a string
extension DomainExtension on Domain { 
  String get name {

    // switch statement to switch on this particular domain and retturn a string
    switch (this) {
      case Domain.ios:
        return Strings.ios;
      
      case Domain.android:
        return Strings.android;

      case Domain.flutter:
        return Strings.flutter;

      case Domain.sss:
        return Strings.sss;

      case Domain.unity:
        return Strings.unity;

      case Domain.macos:
        return Strings.macos;

      case Domain.archived:
        return Strings.archived;

      default:
        return Strings.unknown;
    }
  }
 }