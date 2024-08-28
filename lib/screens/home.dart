import 'package:flutter/material.dart';
import 'package:mariam_task/blocs/article_list_bloc.dart'; // Assuming bloc definition is in blocs/article_list_bloc.dart
import 'package:mariam_task/widgets/ny_appbar.dart';
import 'package:mariam_task/widgets/ny_articles_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mariam_task/events/article_list_event.dart';

class NyTimesMostPopularArticlesHomeScreen extends StatefulWidget {
  final String title;

  const NyTimesMostPopularArticlesHomeScreen({required this.title, super.key});

  @override
  State<NyTimesMostPopularArticlesHomeScreen> createState() => _NyTimesMostPopularArticlesHomeScreenState();
}

class _NyTimesMostPopularArticlesHomeScreenState extends State<NyTimesMostPopularArticlesHomeScreen> {
  final ArticleListBloc _articleListBloc = ArticleListBloc();

  @override
  void initState() {
    super.initState();
    _articleListBloc.add(FetchArticleList(30)); // Dispatch event to fetch articles
  }

  @override
  void dispose() {
    _articleListBloc.close(); // Close the bloc to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArticleListBloc>(
      create: (context) => _articleListBloc, // Provide the bloc instance
      child: Scaffold(
        appBar: NyAppBar(context).createBaseAppbar(widget.title),
        body: Center(
          child: BlocBuilder<ArticleListBloc, ArticleListState>(
            bloc: _articleListBloc,
            builder: (context, state) {
              if (state is ArticleListInitial) {
                return const CircularProgressIndicator(
                  color: Colors.greenAccent,
                  semanticsLabel: 'Circular progress indicator',
                );
              } else if (state is ArticleListLoading) {
                return const CircularProgressIndicator(
                  color: Colors.greenAccent,
                  semanticsLabel: 'Circular progress indicator',
                );
              } else if (state is ArticleListSuccess) {
                return Expanded(child: NyArticlesList(articles: state.articles.articles));
              } else if (state is ArticleListError) {
                return Text('Error: ${state.error}'); // Handle error state
              } else {
                return const Text('Unexpected state'); // Handle unexpected state
              }
            },
          ),
        ),
      ),
    );
  }
}