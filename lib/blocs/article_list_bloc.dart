import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mariam_task/models/article.dart';
import 'package:mariam_task/models/most_popular_list.dart';
import 'package:mariam_task/events/article_list_event.dart';
import 'package:dio/dio.dart';
import '../data/constants.dart';

class ArticleListBloc extends Bloc<ArticleListEvent, ArticleListState> {
  final Dio _dio = Dio();

  ArticleListBloc() : super(ArticleListInitial()) {
    on<FetchArticleList>((event, emit) async {
      emit(ArticleListLoading());
      try {
        final response = await _dio.get(
          '${Constants.mainURL}/mostpopular/v2/mostviewed/${Constants.section}/${event.period}.json?api-key=${Constants.myKey}',
        );
        print('Response status: ${response.statusCode}');

        if (response.statusCode == 200) {
          final data = response.data;
          final articlesList = MostPopularList(
            status: data['status'],
            copyright: data['copyright'],
            numResults: data['num_results'],
            articles: (data['results'] as List)
                .map((articleData) => Article.fromJson(articleData))
                .toList(),
          );
          print('Fetched ${articlesList.articles?.length} articles');
          emit(ArticleListSuccess(articlesList));
        } else {
          emit(ArticleListError('Error fetching articles (Status Code: ${response.statusCode})'));
        }
      } on DioError catch (e) {
        emit(ArticleListError(e.toString()));
        print('Error: ${e.toString()}');
      }
    });
  }
}
