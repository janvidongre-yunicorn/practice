import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../isolate_bloc/task_bloc.dart';
import '../isolate_bloc/task_event.dart';
import '../isolate_bloc/task_state.dart';


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile Page")),
      body: Center(
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<TaskBloc>().add(StartTask());
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Task Started!")),
                    );
                  },
                  child: const Text("Start Background Task"),
                ),
                const SizedBox(height: 20),
                if (state.isLoading) ...[
                  LinearProgressIndicator(value: state.progress / 100),
                  Text("Progress: ${state.progress}%"),
                ],
                if (state.isCompleted)
                  const Text("🎉 Task Done!", style: TextStyle(fontSize: 18)),
              ],
            );
          },
        ),
      ),
    );
  }
}




/// without bloc===========================
/*
import 'dart:isolate';

import 'package:flutter/material.dart';

import '../main.dart';

class ProfilePage extends StatelessWidget {
  void startBackgroundTask() async {
    ReceivePort receivePort = ReceivePort();

    await Isolate.spawn(taskInIsolate, receivePort.sendPort);

    receivePort.listen((message) {
      if (message is int) {
        print("Task Value: $message");
      } else if (message == 'done') {
        taskDoneController.add(true);
        receivePort.close();
      }
    });
  }

  // ===================== Isolate function
  static void taskInIsolate(SendPort sendPort) async {
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(Duration(seconds: 2));
      sendPort.send(i);
    }
    sendPort.send('done');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Page")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            startBackgroundTask();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Background task started!")),
            );
          },
          child: Text("Start Task (1→100)"),
        ),
      ),
    );
  }
}*/