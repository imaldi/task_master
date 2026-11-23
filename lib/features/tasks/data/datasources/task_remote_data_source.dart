import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_master/core/network/dio_client.dart';
import 'package:task_master/features/tasks/domain/models/task.dart';

part 'task_remote_data_source.g.dart';

class TaskRemoteDataSource {
  final Dio _dio;

  TaskRemoteDataSource(this._dio);

  Future<List<Task>> getTasks() async {
    final response = await _dio.get('/tasks');
    final data = response.data as List<dynamic>;
    return data.map((item) => Task.fromJson(item as Map<String, dynamic>)).toList();
  }

  Future<Task> getTaskById(int id) async {
    final response = await _dio.get('/tasks/$id');
    return Task.fromJson(response.data as Map<String, dynamic>);
  }

  Future<Task> createTask(Task task) async {
    final response = await _dio.post('/tasks', data: task.toJson());
    return Task.fromJson(response.data as Map<String, dynamic>);
  }

  Future<Task> updateTask(Task task) async {
    final response = await _dio.put('/tasks/${task.id}', data: task.toJson());
    return Task.fromJson(response.data as Map<String, dynamic>);
  }

  Future<void> deleteTask(int id) async {
    await _dio.delete('/tasks/$id');
  }
}

@riverpod
TaskRemoteDataSource taskRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return TaskRemoteDataSource(dio);
}

