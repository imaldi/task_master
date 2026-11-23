import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_master/features/tasks/data/datasources/task_remote_data_source.dart';
import 'package:task_master/features/tasks/domain/models/task.dart';
import 'package:task_master/features/tasks/domain/repositories/task_repository.dart';

part 'task_repository_impl.g.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDataSource _remoteDataSource;

  TaskRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<Task>> getTasks() => _remoteDataSource.getTasks();

  @override
  Future<Task> getTaskById(int id) => _remoteDataSource.getTaskById(id);

  @override
  Future<Task> createTask(Task task) => _remoteDataSource.createTask(task);

  @override
  Future<Task> updateTask(Task task) => _remoteDataSource.updateTask(task);

  @override
  Future<void> deleteTask(int id) => _remoteDataSource.deleteTask(id);
}

@riverpod
TaskRepository taskRepository(Ref ref) {
  final remoteDataSource = ref.watch(taskRemoteDataSourceProvider);
  return TaskRepositoryImpl(remoteDataSource);
}

