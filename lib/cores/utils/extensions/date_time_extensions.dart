// ignore_for_file: non_constant_identifier_names

extension DateTimeExtension on DateTime {
  String get dd {
    if (day < 10) {
      return "0$day";
    }
    return day.toString();
  }

  String get MMyyyy {
    return "$MM $year";
  }

  String get mm {
    if (month < 10) {
      return "0$month";
    }
    return month.toString();
  }

  String get MMMM {
    switch (month) {
      case DateTime.january:
        return "January";
      case DateTime.february:
        return "February";
      case DateTime.march:
        return "March";
      case DateTime.april:
        return "April";
      case DateTime.may:
        return "May";

      case DateTime.june:
        return "June";
      case DateTime.july:
        return "July";
      case DateTime.august:
        return "August";
      case DateTime.september:
        return "September";
      case DateTime.october:
        return "October";
      case DateTime.november:
        return "November";
      default:
        return "December";
    }
  }

  String get MM {
    switch (month) {
      case DateTime.january:
        return "Jan";
      case DateTime.february:
        return "Feb";
      case DateTime.march:
        return "Mar";
      case DateTime.april:
        return "Apr";
      case DateTime.may:
        return "May";

      case DateTime.june:
        return "June";
      case DateTime.july:
        return "July";
      case DateTime.august:
        return "Aug";
      case DateTime.september:
        return "Sep";
      case DateTime.october:
        return "Oct";
      case DateTime.november:
        return "Nov";
      default:
        return "Dec";
    }
  }

  String get commentTime {
    var now = DateTime.now().toUtc();

    var diff = now.difference(this);
    if (diff.inHours.abs() >= 24) {
      var d = (diff.inHours.abs() / 24).floor();
      return "$d d";
    }
    if (diff.inMinutes.abs() >= 60) {
      var d = (diff.inMinutes.abs() / 60).floor();
      return "$d h";
    }
    if (diff.inSeconds.abs() >= 60) {
      var d = (diff.inSeconds.abs() / 60).floor();
      return "$d m";
    }
    return "${diff.inSeconds.abs()} s";
  }
}
