import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/post_item.dart';
import '../../../domain/params/post_params.dart';
import '../get/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post List'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _showAddPostDialog(context);
            },
          ),
        ],
      ),
      body: Obx(() {
        return Stack(
          children: [
            ListView.builder(
              itemCount: controller.postList.length,
              itemBuilder: (context, index) {
                final post = controller.postList[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text('${post.id}. ${post.title}'),
                    subtitle: Text(post.body),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            _showEditPostDialog(context, post);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            controller.deletePost(post.id);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            if (controller.isLoading) buildLoading(),
          ],
        );
      }),
    );
  }

  void _showAddPostDialog(BuildContext context) {
    final titleController = TextEditingController();
    final bodyController = TextEditingController();

    final formKey = GlobalKey<FormState>();
    bool isTitleEmpty = false;
    bool isBodyEmpty = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Post'),
          content: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: 'Title',
                    errorText: isTitleEmpty ? 'Title is required' : null,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      isTitleEmpty = true;
                      return 'Title is required';
                    }
                    isTitleEmpty = false;
                    return null;
                  },
                ),
                TextFormField(
                  controller: bodyController,
                  decoration: InputDecoration(
                    hintText: 'Body',
                    errorText: isBodyEmpty ? 'Body is required' : null,
                  ),
                  maxLines: 4,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      isBodyEmpty = true;
                      return 'Body is required';
                    }
                    isBodyEmpty = false;
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  final id = controller.postList.isNotEmpty
                      ? controller.postList.last.id + 1
                      : 1;
                  final newPost = PostParams(
                    userId: 1,
                    id: id,
                    title: titleController.text,
                    body: bodyController.text,
                  );
                  controller.createPost(newPost);
                  Get.back();
                }
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showEditPostDialog(BuildContext context, PostItem post) {
    final titleController = TextEditingController(text: post.title);
    final bodyController = TextEditingController(text: post.body);

    final formKey = GlobalKey<FormState>();
    bool isTitleEmpty = false;
    bool isBodyEmpty = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Post'),
          content: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: 'Title',
                    errorText: isTitleEmpty ? 'Title is required' : null,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      isTitleEmpty = true;
                      return 'Title is required';
                    }
                    isTitleEmpty = false;
                    return null;
                  },
                ),
                TextFormField(
                  controller: bodyController,
                  decoration: InputDecoration(
                    hintText: 'Body',
                    errorText: isBodyEmpty ? 'Body is required' : null,
                  ),
                  maxLines: 4,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      isBodyEmpty = true;
                      return 'Body is required';
                    }
                    isBodyEmpty = false;
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  final updatedPost = PostParams(
                    userId: post.userId,
                    id: post.id,
                    title: titleController.text,
                    body: bodyController.text,
                  );
                  controller.updatePost(post.id, updatedPost);
                  Get.back();
                }
              },
              child: Text('Update'),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Widget buildLoading() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black.withValues(alpha: 0.5),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
