import 'package:eccomerce_app/Widget/C_slider.dart';
import 'package:eccomerce_app/Widget/Drawer.dart';
import 'package:eccomerce_app/model/Category.dart';
import 'package:eccomerce_app/resuable/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  static const id = '/Mainpage';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController searchC = TextEditingController();
  List<Category> newList = List.from(
      category_list); // ye code k zarye category data newlist me store kare ga

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: appDrawer(),
        appBar: AppBar(
          title: Text(
            'Home page',
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            // yaha niche search bar bana raha ho

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    textDirection: TextDirection.ltr,

                    // ye niche code me data ko search karne k liye kia he
                    controller: searchC,
                    onChanged: (value) {
                      setState(() {
                        searchC.text = value;
                        newList = category_list
                            .where((e) => e.title.toLowerCase().contains(value))
                            .toList();
                        print(searchC.text);
                      });
                      // yaha tak search code he
                    },
                    decoration: InputDecoration(
                      hintText: 'Search ...',
                      border: InputBorder.none,
                      suffixIcon: Icon(FontAwesomeIcons.search),
                    ),
                  ),
                ),
              ),
            ),
            C_Slider(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'CATEGORY',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            // ye niche method ko me ne call kia niche is me model data ko fetch kia he our data me title our icon he o b fetch kia he.
            get_model_data_title_icon(),
          ],
        ),
      ),
    );
  }

  Column get_model_data_title_icon() {
    return Column(
      // our us category model ko yaha par integrate kia (map ) zarye
      children: newList
          .map((e) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: decoration(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            // our yaha niche text title show kia model see
                            child: Text(
                              e.title,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          // yaha par niche icon show kia model see
                          Icon(
                            e.image,
                            size: 30,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
