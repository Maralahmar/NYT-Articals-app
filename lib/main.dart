import 'package:flutter/material.dart';
import 'package:mariam_task/models/article.dart';
import 'package:mariam_task/screens/details.dart';
import 'package:mariam_task/screens/home.dart';
import 'package:provider/provider.dart';
import 'providers/articlelistprovider.dart';
//A StatelessWidget:
// that does not require mutable state. Once created, the widget’s configuration remains constant throughout its lifecycle.
//A StatefulWidget:
// that can maintain mutable state. It allows the widget to rebuild itself when its state changes.

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Widget multiProvider() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ArticleListProvider()),
      ],
      child: MaterialApp(
        title: 'NYT Most Popular Articles',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const NyTimesMostPopularArticlesHomeScreen(
            title: 'NY Times Most Popular Articles'),
        routes: <String, WidgetBuilder>{
          ArticleDetail.routeKey: (BuildContext context) => ArticleDetail(
              ModalRoute.of(context)!.settings.arguments! as Article),
        },
      ),
    );
  }
  // This widget is the root of my application.
  @override
  Widget build(BuildContext context) {
    return multiProvider();
  }
}
