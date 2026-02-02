class PostParams {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostParams({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });
}
