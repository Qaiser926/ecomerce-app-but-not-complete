import 'package:eccomerce_app/login.dart';
import 'package:flutter/material.dart';
import 'package:eccomerce_app/Widget/Drawer.dart';
import 'package:eccomerce_app/model/Category.dart';
import 'package:eccomerce_app/resuable/style.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
// import "package:multi_image_picker2/multi_image_picker2.dart";

class AddProduct extends StatefulWidget {
  static const id = '/addproduct';

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  var categoryC = TextEditingController();
  var productnameC = TextEditingController();
  var serialCodeC = TextEditingController();
  var priceC = TextEditingController();
  var waightC = TextEditingController();
  var quantityC = TextEditingController();
  var onSaleC = TextEditingController();
  var populerC = TextEditingController();
  var discountC = TextEditingController();
  bool isPopler = false;
  bool isSale = false;
  final _key = GlobalKey<FormState>();
  List<Asset> image =
      <Asset>[]; // ye ak list banaya asset k name see asset k liye

  // save() {
  //   bool isValideted = _key.currentState.validate();
  //   if (isValideted) {}
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: appDrawer(),
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _key,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: addproduct_decoration(),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: DropdownMenu_item(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    decoration: addproduct_decoration(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                        onFieldSubmitted: (value) {
                          setState(() {
                            productnameC.text = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter product name',
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    decoration: addproduct_decoration(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                        onFieldSubmitted: (value) {
                          setState(() {
                            serialCodeC.text = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Serial code',
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    decoration: addproduct_decoration(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                        onFieldSubmitted: (value) {
                          setState(() {
                            priceC.text = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter price',
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    decoration: addproduct_decoration(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                        onFieldSubmitted: (value) {
                          setState(() {
                            waightC.text = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Waight',
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    decoration: addproduct_decoration(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                        onFieldSubmitted: (value) {
                          setState(() {
                            quantityC.text = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Quantity',
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    decoration: addproduct_decoration(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                        onFieldSubmitted: (value) {
                          setState(() {
                            onSaleC.text = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter onSale ',
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    decoration: addproduct_decoration(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                        onFieldSubmitted: (value) {
                          setState(() {
                            populerC.text = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter populer',
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  // ab ye container me ne image picker k liye banaya he
                  height: 250,
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          loadImage();
                        },
                        child: Text(
                          'Pick up',
                        ),
                      ),
                      Expanded(
                        child: Container(
                            // is container k ander hum image add kare ge
                            width: double.infinity,
                            decoration: addproduct_decoration(),
                            child: image.length == 0
                                ? IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.add),
                                  )
                                : GridView.count(crossAxisCount: 3)),
                      ),
                    ],
                  ),
                ),
                SwitchListTile(
                    // is method k zarye swith button create kia he
                    title: Text('is this product is populer'),
                    value: isPopler,
                    onChanged: (v) {
                      setState(() {
                        // our yaha par state change hota he true and false
                        isPopler = v;
                      });
                    }),
                SwitchListTile(
                    title: Text('is this product is onsale'),
                    value: isPopler,
                    onChanged: (v) {
                      setState(() {
                        isSale = v;
                      });
                    }),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Loginpage.id);
                    // save();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: appbarColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            'Save Now',
                            style: TextStyle(color: white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // is method ka zarye multiple image ko pick kare
  loadImage() async {
    List<Asset> resultImage = <Asset>[];
    String error = 'something went wrong';
    try {
      resultImage = await MultiImagePicker.pickImages(
          maxImages: 5, enableCamera: true, selectedAssets: image);
      setState(() {
        image = resultImage; // image me resultimage store ho jaye ga
      });
    } catch (e) {
      // our yaha par agr error agiya to yaha show ye print hoga
      error = e.toString();
      print(error);
    }
  }

  Center Image_shap() {
    return Center(
      child: Container(
        width: 50,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.black38.withOpacity(0.3)),
        child: Center(child: Text('+')),
      ),
    );
  }

  DropdownButtonFormField<String> DropdownMenu_item() {
    return DropdownButtonFormField(
        hint: Text('Select Category'),
        // validator: (v) {
        //   if (v.isEmpty) {
        //     return 'should not be empty';
        //   }
        //   return null;
        // },
        // yaha see lekar ye dropdown menu he
        decoration: InputDecoration(border: InputBorder.none),
        onChanged: (value) {
          // onchange method see enable ho jaye ga

          setState(() {
            categoryC.text = value.toString();
            print(categoryC.text);
          });
        },

        // value: category_list[0]
        //     .title,                     // is line code k zarye bydefault vlaue show kare ga

        items: category_list
            .map((e) => DropdownMenuItem(
                  child: Text(
                      e.title), // our yaha e me sare value he o title ko diye
                  value: e
                      .title, // our value is requird key word he is ko zaror dena pare ga
                ))
            // yaha tak dropdown menu he
            .toList());
  }
}
