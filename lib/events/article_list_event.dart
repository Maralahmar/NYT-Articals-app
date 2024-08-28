// Events
import '../models/most_popular_list.dart';

abstract class ArticleListEvent {}

class FetchArticleList extends ArticleListEvent {
  final int period;

  FetchArticleList(this.period);
}

// States
abstract class ArticleListState {}

class ArticleListInitial extends ArticleListState {}

class ArticleListLoading extends ArticleListState {}

class ArticleListSuccess extends ArticleListState {
  final MostPopularList articles;

  ArticleListSuccess(this.articles);
}

class ArticleListError extends ArticleListState {
  final String error;

  ArticleListError(this.error);
}