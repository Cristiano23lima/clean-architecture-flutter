import 'package:CleanArchitecture/app_widget.dart';
import 'package:CleanArchitecture/modules/search/domain/usecases/search_by_text.dart';
import 'package:CleanArchitecture/modules/search/extenal/datasources/github_datasource.dart';
import 'package:CleanArchitecture/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule{
  @override
  List<Bind> get binds => [
    Bind((i)=> SearchByTextImpl(i())),//i() => injeta as minhas dependencias para o funcionamento das implementações
    Bind((i)=> SearchRepositoryImpl(i())),
    Bind((i)=> GithubDatasource(i())),
    Bind((i)=> Dio()),
  ];

  @override
  List<ModularRouter> get routers => throw UnimplementedError();

  @override
  Widget get bootstrap => AppWidget();

}