import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../model/account/account.dart';
import '../../../model/post/post.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.postAccount,
    required this.post,
  }) : super(key: key);

  final Account postAccount;
  final Post? post;

  @override
  Widget build(BuildContext context) {
    // ellipsisを行う際のバグ対応処理　参考記事 https://qiita.com/sgaku_0514/items/1e03afc37c51844a41a2
    final String nameAndIdText =
        Characters('${postAccount.name}@${postAccount.userId}')
            .replaceAll(Characters(''), Characters('\u{200B}'))
            .toString();

    return Row(
      children: [
        CircleAvatar(
          radius: 22,
          foregroundImage: NetworkImage(postAccount.imagePath),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        maxLines: 1,
                        nameAndIdText,
                        style: const TextStyle(color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      DateFormat("M/d/yy").format(post!.createdAt),
                    ),
                  ],
                ),
                Text(post!.content),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
