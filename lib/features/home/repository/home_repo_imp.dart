import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';


import '../../../data/network/api_failure.dart';
import '../../../data/network/api_request.dart';
import '../../../data/network/api_urls.dart';
import '../../../data/network/http_method.dart';
import '../model/repository_list_model.dart';
import 'home_repo.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImp implements HomeRepository {
  HomeRepositoryImp({required this.apiRequest});

  ApiRequest apiRequest;

  @override
  Future<Either<ApiFailure, RepositoryListModel>> getRepoList(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
        url: ApiUrls.repoUrl,
        method: HttpMethod.get,
        params: params,
        fromJson: RepositoryListModel.fromJson);
  }
}
