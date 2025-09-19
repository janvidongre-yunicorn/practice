import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../isolate_bloc/task_bloc.dart';
import '../isolate_bloc/task_state.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: Center(
        child: BlocConsumer<TaskBloc, TaskState>(
          listener: (context, state) {
            if (state.isCompleted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("✅ Task Completed!")),
              );
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //const Text("Home Page"),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/profile'),
                  child: const Text("Go to Profile"),
                ),
                if (state.isLoading) ...[
                  const SizedBox(height: 20),
                  LinearProgressIndicator(value: state.progress / 100),
                  Text("Progress: ${state.progress}%"),
                ]
              ],
            );
          },
        ),
      ),
    );
  }
}
















/// without bloc ==============================
/*
import 'package:collectins_project/main.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Center(
        child: StreamBuilder<bool>(
          stream: taskDoneController.stream,
          initialData: false,
          builder: (context, snapshot) {
            bool done = snapshot.data ?? false;

            // Show simple text or alert when done
            if (done) {
              Future.microtask(() {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Background task completed!")),
                );
                taskDoneController.add(false); // reset
              });
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Home Page"),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/profile'),
                  child: Text("Go to Profile"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}*/