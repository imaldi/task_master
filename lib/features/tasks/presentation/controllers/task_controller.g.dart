// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TaskListController)
final taskListControllerProvider = TaskListControllerProvider._();

final class TaskListControllerProvider
    extends $AsyncNotifierProvider<TaskListController, List<Task>> {
  TaskListControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'taskListControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$taskListControllerHash();

  @$internal
  @override
  TaskListController create() => TaskListController();
}

String _$taskListControllerHash() =>
    r'36b498666c1d8d954b50b897fc606478db384cb9';

abstract class _$TaskListController extends $AsyncNotifier<List<Task>> {
  FutureOr<List<Task>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Task>>, List<Task>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Task>>, List<Task>>,
              AsyncValue<List<Task>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
