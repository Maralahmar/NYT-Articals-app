import 'package:cached_network_image/cached_network_image.dart'; // Caching images from the network.
import 'package:flutter/material.dart'; // Flutter material design widgets.
import 'package:mariam_task/data/constants.dart'; // Constants for the app.
import 'package:mariam_task/models/article.dart'; // Article model.
import 'package:mariam_task/widgets/article_appbar.dart'; // Custom app bar widget.
import 'package:shimmer/shimmer.dart'; // Shimmer effect for loading placeholders.

class ArticleDetail extends StatefulWidget {
  const ArticleDetail(this._article, {super.key}); // Constructor to accept an Article object.
  final Article _article; // Article instance passed to the widget.
  static const String routeKey = '/ArticleDetail'; // Route key for navigation.

  @override
  State<ArticleDetail> createState() => _ArticleDetailState(); // Creates state for this widget.
}

class _ArticleDetailState extends State<ArticleDetail> {
  @override
  Widget build(BuildContext context) {
    // Determine which image URL to use.
    String? imageUrl = Constants.defImage; // Default image URL.
    if (widget._article.media != null &&
        widget._article.media!.isNotEmpty &&
        widget._article.media!.first.mediaMetadata != null &&
        widget._article.media!.first.mediaMetadata!.isNotEmpty &&
        widget._article.media!.first.mediaMetadata!.length > 2) {
      imageUrl = widget._article.media!.first.mediaMetadata![2].url; // Get image URL from article.
    }

    // Build the widget tree.
    return Scaffold(
      appBar: ArticleAppbar(context).createBaseAppbar("${widget._article.title}"), // Custom app bar.
      body: Column(
        children: [
          // Cached network image with shimmer effect placeholder.
          CachedNetworkImage(
            imageUrl: imageUrl!,
            fit: BoxFit.contain,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[400]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
              ),
            ),
            errorWidget: (context, url, error) => const Icon(
              Icons.error, // Icon to show when image loading fails.
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${widget._article.articlesListAbstract}", // Article abstract text.
              //style: Theme.of(context).textTheme.headline5, // Optional text styling.
            ),
          ),
        ],
      ),
    );
  }
}
