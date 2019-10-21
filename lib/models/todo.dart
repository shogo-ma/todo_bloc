import 'package:uuid/uuid.dart';

class Todo {
  String content;
  String id;

  final uuid = Uuid();

  Todo(String _content) {
    this.content = _content;
    this.id = uuid.v4();
  }
}
