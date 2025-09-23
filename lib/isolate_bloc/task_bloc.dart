import 'dart:async';
import 'dart:isolate';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<StartTask>(_onStartTask);
    on<UpdateProgress>((event, emit) {
      emit(state.copyWith(progress: event.progress));
    });
    on<TaskCompleted>((event, emit) {
      emit(state.copyWith(isLoading: false, isCompleted: true));
    });
  }




  Future<void> _onStartTask( event, emit) async {
    emit(state.copyWith(isLoading: true, progress: 0, isCompleted: false));

    ReceivePort receivePort = ReceivePort();
    await Isolate.spawn(_taskInIsolate, receivePort.sendPort);

    receivePort.listen((message) {
      if (message is int) {
        add(UpdateProgress(message));
      } else if (message == 'done') {
        add(TaskCompleted());
        receivePort.close();
      }
    });
  }

  // =============== Isolate function
  static void _taskInIsolate(SendPort sendPort) async {
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      sendPort.send(i * 10); // % progress
    }
    sendPort.send('done');
  }
}
