import 'package:get/get.dart';
import 'package:get_management_statement/data/model/my_model.dart';
import 'package:get_management_statement/data/repository/posts_repository.dart';

class GetXController extends GetxController {
  PostRepository repository;

  GetXController(this.repository);

  final _postsList = <MyModel>[].obs;

  get postList => this._postsList.value;

  set postList(value) => this._postsList.value = value;

  getAll() async {
    var data = await repository.getAll();
    this.postList = data;
  }

  @override
  void onClose() {
    super.onClose();
  }
}
