import 'package:equatable/equatable.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

class StartTask extends TaskEvent {}
class UpdateProgress extends TaskEvent {
  final int progress;
  const UpdateProgress(this.progress);

  @override
  List<Object?> get props => [progress];
}

class TaskCompleted extends TaskEvent {}
