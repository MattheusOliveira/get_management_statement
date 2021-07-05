import 'package:get_management_statement/data/model/pagination_filter.dart';
import 'package:get_management_statement/data/provider/api.dart';

class UserRepository {

  MyApiClient apiClient;

  UserRepository(this.apiClient) : assert(apiClient != null);

   getUsers(PaginationFilter filter) {
    return apiClient.findAll(filter);
  } 

}