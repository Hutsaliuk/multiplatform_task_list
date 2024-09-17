/*

Task model

This is what todo object is

--------------------------------------------------------------------------------

Fields:

- id
- text
- isComplete

Methods:

- toggleCompletion - switch between on\off

*/

class Task {
  final int id;
  final String text;
  final bool isCompleted;

  Task({
    required this.id,
    required this.text,
    this.isCompleted = false,
  });

  Task toggleCompletion() {
    return Task(
      id: id,
      text: text,
      isCompleted: !isCompleted,
    );
  }
}
