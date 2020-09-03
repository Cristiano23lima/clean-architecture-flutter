import 'package:CleanArchitecture/modules/search/domain/entities/result_search.dart';
import 'package:CleanArchitecture/modules/search/domain/errors/errors.dart';
import 'package:CleanArchitecture/modules/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

abstract class SearchByText {
  Future<Either<FailureSearch, List<ResultSearch>>> call(
      String
          searchText); //ele pode me retornar um exception ou o valor que eu quero que é a lista
}

class SearchByTextImpl implements SearchByText {
  final SearchRepository repository;

  SearchByTextImpl(this.repository);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> call(
      String searchText) async {
    if (searchText == null || searchText.isEmpty) {
      return Left(InvalidTextError());
    }
    return repository.search(searchText);
  }
}
