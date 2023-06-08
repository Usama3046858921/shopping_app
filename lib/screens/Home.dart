import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../Api/Fetch_Data.dart';
import '../Modules/ProductData.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

List<String> foodList = [
  'https://images.unsplash.com/photo-1525609004556-c46c7d6cf023?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8Y2Fyc3xlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'
      'https://images.unsplash.com/photo-1628519592419-bf288f08cef5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fHNwb3J0cyUyMGNhcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'
      'https://images.unsplash.com/photo-1525609004556-c46c7d6cf023?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8Y2Fyc3xlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'
      'https://images.unsplash.com/photo-1628519592419-bf288f08cef5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fHNwb3J0cyUyMGNhcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'
];
List<String> categorys = [];

class _HomeState extends State<Home> {
  List<ProductData> listData = [];
  Future<void> apiDataFetch() async {
    await FetchDataApi().processData().then((value) {
      setState(() {
        listData = value;
      });
    });
    listData.forEach((element) {
      if (categorys.contains(element.category)) {
      } else {
        categorys.add(element.category.toString());
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiDataFetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            headerView(),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        //add prefix icon
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        fillColor: Colors.grey,

                        // hintText: "Email/Mobile",

                        //make hint text
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontFamily: "verdana_regular",
                          fontWeight: FontWeight.w400,
                        ),

                        //create lable
                        labelText: 'Search for shops & restaurants',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontFamily: "verdana_regular",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  bannerView(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Wrap(
                      children: List.generate(listData.length, (index) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          height: 200,
                          width: kIsWeb
                              ? 200
                              : MediaQuery.of(context).size.width / 2 - 20,
                          decoration: BoxDecoration(
                              color: Color(0xfff2f9f1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Text(
                                '${listData[index].title}',
                                maxLines: 1,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Container(
                                  child: Text(
                                '${listData[index].description}',
                                maxLines: 2,
                                style: TextStyle(color: Colors.black38),
                              )),
                              Flexible(
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              listData[index].image.toString()),
                                          fit: BoxFit.cover)),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bannerView() {
    return Container(
      height: 170,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(20),
      child: PageView.builder(
          controller: PageController(
              initialPage: 2, keepPage: true, viewportFraction: 1),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: PageView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          foodList[index],
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }),
    );
  }

  Widget headerView() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(padding: EdgeInsets.all(7)),
              Icon(
                Icons.location_on_outlined,
                color: Colors.red,
                size: 25,
              ),
              Padding(padding: EdgeInsets.all(7)),
              Text(
                'Shopping in Riyadh',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(left: 5),
                alignment: Alignment.center,
                height: 25,
                width: 110,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  'Change Location',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(7),
            child: Image(
              image: AssetImage(
                'images/heartIcon.png',
              ),
              height: 25,
            ),
          ),
        ],
      ),
    );
  }
}
