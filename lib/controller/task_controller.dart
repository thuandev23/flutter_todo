import 'package:flutter_todo/model/task.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;

  // thêm task mới
  void addTask(String title) {
    tasks.add(Task(title: title));
  }

  // xoá task 
  void removeTask(int index) {
    tasks.removeAt(index);
  }

  // task hoàn thành sau khi chọn
  void toggleTask(int index) {
    tasks[index].isCompleted = !tasks[index].isCompleted;
    tasks.refresh();
  }
}
