import 'package:flutter/material.dart';

class Categorieswidget extends StatefulWidget {
  const Categorieswidget({super.key});

  @override
  State<Categorieswidget> createState() => _CategorieswidgetState();
}

class _CategorieswidgetState extends State<Categorieswidget> {
  List<String> categoryName = [
    "Lifestyle",
    "Technology",
    "Sports",
    "Health",
    "Culture",
    "Work",
    "Fashion"
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < categoryName.length; i++)
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      categoryName[i],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: const Color.fromARGB(255, 87, 83, 83),
                      ),
                    )
                  ],
                )),
        ],
      ),
    );
  }
}
