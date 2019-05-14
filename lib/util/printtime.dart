String printTime(int time) {
  int minutes = (time/60).floor();
  int seconds = (time%60).round();
  String myMinutes =
  ((time/60).floor() < 10) ? '0' + minutes.toString() : minutes.toString();

  String mySeconds =
  ((time%60).round() < 10) ? '0' + seconds.toString() : seconds.toString();
  return myMinutes + ':' + mySeconds;
}