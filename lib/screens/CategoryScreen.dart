import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({Key? key}) : super(key: key);
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Wrap(
              children: List.generate(categorys.length, (index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  height: 200,
                  width:
                      kIsWeb ? 200 : MediaQuery.of(context).size.width / 2 - 20,
                  decoration: BoxDecoration(
                      color: Color(0xfff2f9f1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Text(
                        '${categorys[index].toString()}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      // Image(image: AssetImage('images/mens_clothes_images.jpg'),),

                    ],
                  ),

                  // Text(
                  //   '${categorys[index].toString()}',
                  //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  // ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
