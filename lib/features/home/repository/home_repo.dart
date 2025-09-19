import 'package:dartz/dartz.dart';


import '../../../../data/network/api_failure.dart';
import '../model/repository_list_model.dart';

abstract class HomeRepository {
  Future<Either<ApiFailure, RepositoryListModel>> getRepoList(
      Map<String, dynamic> params);
}
