import 'package:dio/dio.dart'; // For making HTTP requests.
import 'package:flutter/foundation.dart'; // For debugging support.
import 'package:mariam_task/data/constants.dart'; // For constants like URLs and API keys.
import 'package:mariam_task/models/most_popular_list.dart'; // Model for the most popular list of articles.
class ArticleListBloc extends Bloc<ArticleListEvent, ArticleListState> {
  final Dio _dio = Dio();

  ArticleListBloc() : super(ArticleListInitial());

  @override
  Stream<ArticleListState> mapEventToState(ArticleListEvent event) async* {
    if (event is FetchArticleList) {
      yield ArticleListLoading();
      try {
        final response = await _dio.get(
          '${Constants.mainURL}/mostpopular/v2/mostviewed/${Constants.section}/${event.period}.json?api-key=${Constants.myKey}',
        );
        if (response.statusCode == 200) {
          final articles = MostPopularList.fromJson(response.data);
          yield ArticleListSuccess(articles);
        } else {
          yield ArticleListError('Error fetching articles (Status Code: ${response.statusCode})');
        }
      } on DioError catch (e) {
        yield ArticleListError(e.toString()); // Handle specific error types if needed
      }
    }
  }
}