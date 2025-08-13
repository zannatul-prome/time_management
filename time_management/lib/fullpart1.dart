import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  runApp(const TaskApp());
}

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      home: TaskHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Task {
  String title;
  bool isDone;

  Task(this.title, {this.isDone = false});
}

class TaskHomePage extends StatefulWidget {
  @override
  _TaskHomePageState createState() => _TaskHomePageState();
}

class _TaskHomePageState extends State<TaskHomePage>
    with SingleTickerProviderStateMixin {
  List<Task> tasks = [];
  final TextEditingController _controller = TextEditingController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _addTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        tasks.add(Task(_controller.text));
        _controller.clear();
      });
    }
  }

  void _deleteTask(Task task) {
    setState(() {
      tasks.remove(task);
    });
  }

  void _clearAllTasks() {
    setState(() {
      tasks.clear();
    });
  }

  void _exitApp() {
    exit(0); // Closes the app
  }

  List<Task> get remainingTasks =>
      tasks.where((task) => !task.isDone).toList();

  List<Task> get completedTasks =>
      tasks.where((task) => task.isDone).toList();

  Widget buildTaskCard(Task task) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: task.isDone ? Colors.green[100] : Colors.blue[100],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: task.isDone ? Colors.green : Colors.blue,
          width: 1.5,
        ),
      ),
      child: ListTile(
        leading: Checkbox(
          value: task.isDone,
          onChanged: (bool? value) {
            setState(() {
              task.isDone = value ?? false;
            });
          },
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration:
                task.isDone ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () => _deleteTask(task),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Remaining'),
            Tab(text: 'Completed'),
          ],
        ),
      ),
      body: Column(
        children: [
          // Input and buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          labelText: 'Enter task',
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: _addTask,
                      child: const Text('Add'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Total Tasks: ${tasks.length}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    ElevatedButton(
                      onPressed: _clearAllTasks,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      child: const Text('Clear All'),
                    ),
                    ElevatedButton(
                      onPressed: _exitApp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text('Exit'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Task sections
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Remaining Tasks
                ListView(
                  children:
                      remainingTasks.map((task) => buildTaskCard(task)).toList(),
                ),
                // Completed Tasks
                ListView(
                  children:
                      completedTasks.map((task) => buildTaskCard(task)).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}