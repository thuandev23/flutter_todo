import 'package:flutter/material.dart';
import 'package:flutter_todo/controller/task_controller.dart';
import 'package:get/get.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({super.key});
  final TaskController taskController = Get.put(TaskController());
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo -List")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: "Enter your task",
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (textController.text.isNotEmpty) {
                      taskController.addTask(textController.text);
                      textController.clear();
                    }
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: taskController.tasks.length,
                itemBuilder: (context, index) {
                  final task = taskController.tasks[index];
                  return ListTile(
                    title: Text(
                      task.title,
                      style: TextStyle(
                        decoration:
                            task.isCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                        color: task.isCompleted ? Colors.grey : Colors.black,
                      ),
                    ),
                    leading: Checkbox(
                      value: task.isCompleted,
                      onChanged: (value) => taskController.toggleTask(index),
                    ),
                    trailing: IconButton(
                      onPressed: () => taskController.removeTask(index),
                      icon: Icon(Icons.delete),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
