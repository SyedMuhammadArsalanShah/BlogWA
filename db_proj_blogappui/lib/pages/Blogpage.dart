import 'package:flutter/material.dart';

import 'Homepage.dart';

class Blogpage extends StatefulWidget {
  const Blogpage({super.key});

  @override
  State<Blogpage> createState() => _BlogpageState();
}

class _BlogpageState extends State<Blogpage> {
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    String dateStr = "${today.day}/${today.month}/${today.year}";

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xFFEDECF2),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Hero(
                    tag: "blogImage",
                    child: Image.asset(
                      "assets/images/1.jpg",
                      height: 350.0,
                      width: size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 64,
                      bottom: 0.0,
                      left: 24,
                      right: 24,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///back icon
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Homepage(),
                                ));
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(48.0),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: size.width / 2,
                          child: Text(
                            "Techology and Artificial Intelligence",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          height: 34,
                          width: 98,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "$dateStr",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: "Mulish-SemiBold",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1.0,
                      color: Colors.black.withOpacity(0.08),
                      height: 32.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          child: Image.asset(
                            "assets/images/followicon.png",
                            height: 40.0,
                            width: 40.0,
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Expanded(
                            child: Text(
                          "User1",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.03),
                            fontFamily: "Mulish-SemiBold",
                          ),
                        )),
                        ////////////follow option
                        Text.rich(
                          TextSpan(children: [
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Image.asset(
                                "assets/images/followicon.png",
                                height: 65.0,
                                width: 65.0,
                              ),
                            ),
                            TextSpan(text: " "),
                            TextSpan(
                                text: "Follow",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontFamily: "Mulish-SemiBold",
                                )),
                          ]),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1.0,
                      color: Colors.black.withOpacity(0.08),
                      height: 32.0,
                    ),
                    ///////////////////////////////////////ARTICLE/////////
                    Text(
                      "Lorem ipsum dolor sit amet, Quisque metus arcu, sollicitudin et efficitur eu, semper eget leo. Vivamus elementum vehicula diam accumsan rhoncus. Etiam nulla est, eleifend et consequat id, luctus vitae dui. Mauris convallis neque ut mollis mattis consectetur adipiscing elit. Integer porta commodo turpis eu porta. Nulla vel enim gravida, imperdiet metus sed, ultricies tellus. Proin euismod lobortis varius. Maecenas vel pharetra nisl, a venenatis nunc. Quisque rutrum diam eget sem finibus interdum. Proin vehicula, nunc quis suscipit pulvinar, massa lorem rhoncus tortor, sit amet vehicula tortor ante eu diam. Suspendisse neque tellus, vehicula a purus id, consectetur ultricies mau",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: "Mulish-SemiBold",
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
