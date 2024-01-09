
final class Todo  {
  const Todo( {
    required this.id,
    required this.isLiked,
  });

  final int id;
  final bool isLiked;

  Todo copyWith({
    int? id,
    bool? isLiked,
  }) {
    return Todo(
      id: id ?? this.id,
      isLiked: isLiked ?? this.isLiked,
    );
  }


}