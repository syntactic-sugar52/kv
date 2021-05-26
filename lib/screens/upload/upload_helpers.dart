import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kv/constants/colors.dart';
import 'package:kv/screens/feed/feed_screen.dart';
import 'package:kv/screens/homepage/home_page.dart';
import 'package:kv/utils/upload_post.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class UploadHelpers with ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  String selectedType;
  String categoryVal;

  Widget appar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text("Post Video"),
      backgroundColor: kBlack,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
          // Navigator.pushReplacement(
          //     context,
          //     PageTransition(
          //         child: HomePage(), type: PageTransitionType.rightToLeft));
        },
        color: kWhite,
      ),
    );
  }

  buildDetails() {
    // var videoProvider = Provider.of<VideoProvider>(context);
    return Expanded(
      child: Container(
        padding:
            const EdgeInsets.only(left: 10.0, right: 10.0, top: 10, bottom: 10),
        child: TextField(
          controller: detailsController,
          cursorColor: Colors.grey.shade500,
          style: TextStyle(color: kPrimaryBackground),
          decoration: new InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryBackground, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryBackground, width: 1.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                const Radius.circular(5.0),
              ),
              borderSide: new BorderSide(
                color: kPrimaryBackground,
                width: 1.0,
              ),
            ),
          ),
          inputFormatters: [LengthLimitingTextInputFormatter(100)],
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          maxLines: 100,
        ),
      ),
    );
  }

  buildTitle(BuildContext context) {
    //Todo:  add hint text
    return Container(
      height: 60,
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10, bottom: 5),
      child: TextField(
        controller: titleController,
        cursorColor: Colors.grey.shade500,
        style: TextStyle(color: kPrimaryBackground),
        decoration: new InputDecoration(
          contentPadding: const EdgeInsets.all(15.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryBackground, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryBackground, width: 1.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              const Radius.circular(5.0),
            ),
            borderSide: new BorderSide(
              color: kPrimaryBackground,
              width: 1.0,
            ),
          ),
        ),
        maxLines: 1,
        // onChanged: (text) => videoProvider.setTitleText(text),
        // controller: _titleController,
      ),
    );
  }

  List<String> _cardType = [
    'Product',
    'Service',
    'Information',
    'Referral',
    'Investment'
  ];
  //todo: change categories
  List<String> _category = [
    'Arts and Crafts',
    'Automotive',
    'Baby',
    'Beauty and personal care',
    'Computers',
    'Electronics',
    'Fashion',
    'Health and Household',
    'Home and Kitchen',
    'Industrial and Scientific',
    'Movies and Television',
    'Pet supplies',
    'Software',
    'Sports and Outdoors',
    'Smart Home',
    'Tools & Home Improvement',
    'Toys and Games',
    'Video Games',
    "Food",
    "Transport",
    "Real Estate",
    "Personal",
    "Shopping",
    "Medical",
    "Rent",
    "Movie",
    "CryptoCurrency",
    "Education",
    "Others"
  ];
  dropDownCardType(BuildContext context, Function state) {
    final width = MediaQuery.of(context).size.width;

    return ListTile(
      leading: Text(
        "Type of : ",
        style: TextStyle(color: kPrimaryBackground),
      ),
      title: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          width: width / 2,
          height: 45,
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: kPrimaryBackground)),
          child: DropdownButton(
            iconEnabledColor: kPurple,
            dropdownColor: kWhite,
            underline: Container(
              color: Colors.transparent,
            ),
            hint: Text(
              'What are you offering?',
              style: TextStyle(color: kPrimaryBackground),
            ),
            value: selectedType,
            onChanged: state,
            items: _cardType.map((val) {
              return DropdownMenuItem(
                child: new Text(
                  val,
                  style: TextStyle(color: kPrimaryBackground),
                ),
                value: val,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  buildPrice(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ListTile(
      leading: Text(
        "Price: ",
        style: TextStyle(
          color: kPrimaryBackground,
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          padding: const EdgeInsets.only(left: 4.0, right: 10.0),
          width: width / 3,
          height: 45,
          child: TextField(
            controller: priceController,
            cursorColor: Colors.grey.shade500,
            keyboardType: TextInputType.number,
            style: TextStyle(color: kPrimaryBackground),
            decoration: new InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryBackground, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryBackground, width: 1.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  const Radius.circular(5.0),
                ),
                borderSide: new BorderSide(
                  color: kPrimaryBackground,
                  width: 1.0,
                ),
              ),
            ),
            maxLines: 1,
          ),
        ),
      ),
    );
  }

  buildQuantity(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ListTile(
      leading: Text(
        "Quantity ",
        style: TextStyle(
          color: kPrimaryBackground,
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          padding: const EdgeInsets.only(left: 4.0, right: 10.0),
          width: width / 3,
          height: 45,
          child: TextField(
            controller: quantityController,
            cursorColor: Colors.grey.shade500,
            keyboardType: TextInputType.number,
            style: TextStyle(color: kPrimaryBackground),
            decoration: new InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryBackground, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryBackground, width: 1.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  const Radius.circular(5.0),
                ),
                borderSide: new BorderSide(
                  color: kPrimaryBackground,
                  width: 1.0,
                ),
              ),
            ),
            maxLines: 1,
          ),
        ),
      ),
    );
  }

  dropDownCategory(BuildContext context, Function state) {
    final width = MediaQuery.of(context).size.width;

    return ListTile(
      leading: Text(
        "Category: ",
        style: TextStyle(
          color: kPrimaryBackground,
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          width: width / 2,
          height: 45,
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: kPrimaryBackground)),
          child: DropdownButton(
            isExpanded: true,
            iconEnabledColor: kPurple,
            dropdownColor: kWhite,
            underline: Container(
              color: Colors.transparent,
            ),
            hint: Text(
              ' Select a Category',
              style: TextStyle(color: kPrimaryBackground),
            ),
            value: categoryVal,
            onChanged: state,
            items: _category.map((value) {
              return DropdownMenuItem(
                child: new Text(
                  value,
                  style: TextStyle(color: kPrimaryBackground),
                ),
                value: value,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget buildFormField(
      BuildContext context, Function stateType, Function stateCategory) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: kWhite,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 15.0),
                  dropDownCardType(context, stateType),
                  dropDownCategory(context, stateCategory),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Title: ",
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ),
                    ],
                  ),
                  buildTitle(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Details: ",
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ),
                    ],
                  ),
                  buildDetails(),
                  buildQuantity(context),
                  buildPrice(context),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
