// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_remote_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(taskRemoteDataSource)
final taskRemoteDataSourceProvider = TaskRemoteDataSourceProvider._();

final class TaskRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          TaskRemoteDataSource,
          TaskRemoteDataSource,
          TaskRemoteDataSource
        >
    with $Provider<TaskRemoteDataSource> {
  TaskRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'taskRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$taskRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<TaskRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TaskRemoteDataSource create(Ref ref) {
    return taskRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TaskRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TaskRemoteDataSource>(value),
    );
  }
}

String _$taskRemoteDataSourceHash() =>
    r'f2cee822fa6cc0f6a80c7741b07c96e2b321e016';
