class PostItemModel {
  final int userId;
  final int id;
  final String? title;
  final String? body;

  const PostItemModel({
    required this.userId,
    required this.id,
    this.title,
    this.body,
  });

  factory PostItemModel.fromJson(Map<String, dynamic> json) {
    return PostItemModel(
      userId: (json['userId'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      title: (json['title'] as String?) ?? '',
      body: (json['body'] as String?) ?? '',
    );
  }
}
