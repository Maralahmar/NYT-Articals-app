import 'package:dio/dio.dart'; // For making HTTP requests.
import 'package:flutter/foundation.dart'; // For debugging support.
import 'package:mariam_task/data/constants.dart'; // For constants like URLs and API keys.
import 'package:mariam_task/models/most_popular_list.dart'; // Model for the most popular list of articles.

class ArticleListProvider with ChangeNotifier {
  // Holds the current list of popular articles.
  MostPopularList _mostPopularList = MostPopularList();

  // Getter for the most popular list.
  MostPopularList get mostPopularList => _mostPopularList;

  // Setter for the most popular list.
  set mostPopularList(MostPopularList value) {
    _mostPopularList = value;
    notifyListeners(); // Notify listeners that the list has been updated.
  }

  // Fetches the article list from the API.
  Future<Response<dynamic>> getArticleListRes(int period) async {
    final endPoint = '${Constants.mainURL}/mostpopular/v2/mostviewed/${Constants.section}/${period}.json?api-key=${Constants.myKey}';

    var dio = Dio(); // Create Dio instance for making HTTP requests.
    try {
      var response = await dio.get(endPoint); // Send GET request to the API.

      if (response.statusCode == 200) {
        // If the request was successful (status code 200), update the list.
        _mostPopularList = MostPopularList.fromJson(response.data);
        notifyListeners(); // Notify listeners that the data has been updated.
      }

      return response; // Return the API response.
    } on DioError catch (e) {
      // Handle errors, print error if in debug mode.
      if (kDebugMode) {
        print(e);
      }
      return e.response!; // Return error response.
    }
  }
}