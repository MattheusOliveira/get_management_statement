import 'package:get_management_statement/data/provider/api.dart';

class PostRepository {
 
  MyApiClient apiClient;

  PostRepository(this.apiClient);

  getAll() {
    return apiClient.getAll();
  }
  
}