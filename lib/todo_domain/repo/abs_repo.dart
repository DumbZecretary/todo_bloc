import 'package:todo_app/todo_domain/models/task_model.dart';

abstract class AbsTodoRepo {
  create();
  insert(Task task);
  read();
  delete(String id);
  update(String id, Task task);
}
