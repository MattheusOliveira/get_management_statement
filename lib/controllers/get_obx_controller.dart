import 'package:get/state_manager.dart';
import 'package:get_management_statement/data/model/pagination_filter.dart';
import 'package:get_management_statement/data/model/user.dart';
import 'package:get_management_statement/data/repository/user_repository.dart';

class GetObxController extends GetxController {
  
  UserRepository userRepository;

  final _users = <User>[].obs;  
  final _paginationFilter = PaginationFilter().obs;
  final _lastPage = false.obs;
  final _isFirstLoadingExecution = false.obs;

  List<User> get users => _users;
  int? get limit => _paginationFilter.value.limit;
  int? get _page => _paginationFilter.value.page;
  bool get lastPage => _lastPage.value;
  bool get isFirstLoadingExecution => _isFirstLoadingExecution.value;
  set isFirstLoadingExecution(value) => _isFirstLoadingExecution.value = value;
  
  GetObxController(this.userRepository);

  @override
  void onInit() {
    ever(_paginationFilter, (_) => {
      _findUsers()
    });
    _changePaginationFilter(1, 15);
    super.onInit();
  }

  Future<void> _findUsers() async{
    final usersData = await userRepository.getUsers(_paginationFilter.value);

    if(usersData.isEmpty) {
      _lastPage.value = true;
    }
    _users.addAll(usersData);

    _isFirstLoadingExecution.value = false;
  }

  void changeTotalPerPage(int limitValue) {
    _users.clear();
    _lastPage.value = false;
    _changePaginationFilter(1, limitValue);
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val!.page = page;
      val.limit = limit;
    });
  }

  void nextPage() {
    _isFirstLoadingExecution.value = true;
    _changePaginationFilter(_page! + 1, limit!);
  }

  @override
  void onClose() {
    super.onClose();
  }

}