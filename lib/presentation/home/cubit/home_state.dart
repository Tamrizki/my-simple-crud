import 'package:equatable/equatable.dart';
import '../../../../domain/entities/post_item.dart';
import '../../../consts/status.dart';

class HomeState extends Equatable {
  final Status status;
  final List<PostItem> posts;
  final String? errorMessage;

  const HomeState({
    this.status = Status.initial,
    this.posts = const [],
    this.errorMessage,
  });

  HomeState copyWith({
    Status? status,
    List<PostItem>? posts,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, posts, errorMessage];
}
