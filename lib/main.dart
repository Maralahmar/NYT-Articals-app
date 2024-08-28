import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mariam_task/blocs/article_list_bloc.dart';
import 'package:mariam_task/screens/home.dart';
import 'package:mariam_task/screens/details.dart'; // Import your ArticleDetail screen
import 'package:mariam_task/models/article.dart'; // Import the Article model

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticleListBloc(),
      child: MaterialApp(
        title: 'NYT Most Popular Articles',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                builder: (context) => const NyTimesMostPopularArticlesHomeScreen(
                  title: 'NYT Most Popular Articles',
                ),
              );
            case ArticleDetail.routeKey:
              final Article article = settings.arguments as Article; // Extract the Article object
              return MaterialPageRoute(
                builder: (context) => ArticleDetail(article),
              );
            default:
              return MaterialPageRoute(
                builder: (context) => Scaffold(
                  appBar: AppBar(title: const Text('Error')),
                  body: const Center(child: Text('Page not found')),
                ),
              );
          }
        },
      ),
    );
  }
}
