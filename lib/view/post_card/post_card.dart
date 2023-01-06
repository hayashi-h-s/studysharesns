import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/account/account.dart';
import '../../model/post/post.dart';

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
                        "${postAccount.name}@${postAccount.userId}",
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
