import 'package:flutter/material.dart';

class Likebtn extends StatefulWidget {
  final bool isLiked;
  void Function()? onTap;
  Likebtn({super.key, required this.isLiked, required this.onTap});
  @override
  State<Likebtn> createState() => _LikebtnState();
}

class _LikebtnState extends State<Likebtn> {
  final bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        size: 28,
        isLiked ? Icons.favorite : Icons.favorite_border,
        color: isLiked
            ? Colors.redAccent
            : const Color.fromARGB(255, 136, 132, 132),
      ),
    );
  }

  void onTap() {}
}
