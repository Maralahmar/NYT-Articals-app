import 'package:flutter/material.dart';
import 'package:mariam_task/models/article.dart';
import 'package:mariam_task/screens/details.dart';
import 'cached_image_with_placeholder.dart';

class NyArticlesListItem extends StatelessWidget {
  Article? article;
  NyArticlesListItem({this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: ListTile(
          contentPadding: const EdgeInsets.all(8),
          onTap: () {
            Navigator.pushNamed(context, ArticleDetail.routeKey,
                arguments: article);
          },
          title: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              "${article!.title}",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${article!.byline}",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 1,
                      child: Text(
                        "${article!.source}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )),
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.date_range,
                          size: 17,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Text(
                          "${article!.publishedDate}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          leading: CachedImageWithPlaceholder(
              "${article!.media![0].mediaMetadata![0].url}", BoxFit.cover),
          trailing: const Icon(Icons.keyboard_arrow_right),
        ),
      ),
    );
  }
}
