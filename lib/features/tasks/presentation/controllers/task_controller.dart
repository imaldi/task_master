import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_master/features/tasks/data/repositories/task_repository_impl.dart';
import 'package:task_master/features/tasks/domain/models/task.dart';

part 'task_controller.g.dart';

@riverpod
class TaskListController extends _$TaskListController {
  @override
  FutureOr<List<Task>> build() async {
    return ref.watch(taskRepositoryProvider).getTasks();
  }

  Future<void> addTask({
    required String title,
    String? description,
    DateTime? dueDate,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(taskRepositoryProvider);
      final newTask = Task(
        title: title,
        description: description ?? '',
        dueDate: dueDate,
      );
      await repository.createTask(newTask);
      return repository.getTasks();
    });
  }

  Future<void> toggleTask(Task task) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(taskRepositoryProvider);
      final updated = task.copyWith(isCompleted: !task.isCompleted);
      await repository.updateTask(updated);
      return repository.getTasks();
    });
  }

  Future<void> deleteTask(int id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(taskRepositoryProvider);
      await repository.deleteTask(id);
      return repository.getTasks();
    });
  }
}
