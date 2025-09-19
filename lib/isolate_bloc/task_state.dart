import 'package:equatable/equatable.dart';

class TaskState extends Equatable {
  final bool isLoading;
  final int progress;
  final bool isCompleted;

  const TaskState({
    this.isLoading = false,
    this.progress = 0,
    this.isCompleted = false,
  });

  TaskState copyWith({
    bool? isLoading,
    int? progress,
    bool? isCompleted,
  }) {
    return TaskState(
      isLoading: isLoading ?? this.isLoading,
      progress: progress ?? this.progress,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [isLoading, progress, isCompleted];
}
