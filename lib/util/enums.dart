enum AnimationState {
  DEFAULT_STATE,
  SHOW_ANSWER,
}

const int TEST_LENGTH = 20;
List<List<String>> questions;
const int TEST_TIME_LIMIT = 30 * 60;
double textSize = 15;
const int PASSING_GRADE = 20;
const double PASSING_PERCENTAGE = 0.75;

String mySelectedProvince = 'Ontario';


void setTextSize(screenWidth, screenHeight) {
  if(screenWidth < 340 || screenHeight < 540) {
    textSize = 10;
  }
}