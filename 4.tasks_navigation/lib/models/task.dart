/// Simple task row for the demo list.
///
/// Kept immutable: when “complete” toggles, [HomeScreen] replaces the item with
/// [copyWith] so you practice updating a [List] inside [setState] without
/// mutating fields from random places.
class Task {
  const Task({required this.id, required this.title, this.completed = false});

  /// Stable key for [ListView] / Dismissible. Not shown in UI.
  final String id;
  final String title;
  final bool completed;

  Task copyWith({bool? completed}) {
    return Task(id: id, title: title, completed: completed ?? this.completed);
  }
}
