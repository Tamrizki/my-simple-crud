import '../../data/models/post_item_model.dart';
import '../entities/post_item.dart';

class PostItemModelMapper {
  static PostItem toEntity(PostItemModel? model) {
    return PostItem(
      userId: model?.userId ?? 0,
      id: model?.id ?? 0,
      title: model?.title ?? '',
      body: model?.body ?? '',
    );
  }

  static List<PostItem> toEntityList(List<PostItemModel> models) =>
      models.map((item) => toEntity(item)).toList();
}
