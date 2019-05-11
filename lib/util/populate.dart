import 'dart:math';

List<int> generateQuestions (int n, int rangeMax) {
  Random randGenerator = new Random();
  List<int> questions = new List<int>();
  while (questions.length < n) {
    int temp = randGenerator.nextInt(rangeMax);
    if (!questions.contains(temp)) {
      questions.add(temp);
    }
  }
  return questions;
}

List<int> generateOrder (int n) {
  Random randGenerator = new Random();
  List<int> candidates = new List<int>.generate(n, (i) => i + 1);
  List<int> selected = new List<int>();
  while(candidates.length != 0) {
    int temp = randGenerator.nextInt(candidates.length);
    selected.add(candidates.removeAt(temp));
  }
  return selected;
}