import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shadow_clip/shadow_clip.dart';
import 'package:flutter/material.dart';
import '../../const/colors.dart';
import '../../utils/helper.dart';
import '../../widgets/customNavBar.dart';

class IndividualItem3 extends StatefulWidget {
  static const routeName = "/individualScreen3";

  @override
  _IndividualItemState createState() => _IndividualItemState();
}

class _IndividualItemState extends State<IndividualItem3> {
  String? _selectedSize1; // Declare a variable for the first dropdown
  String? _selectedSize2; 
  int _portionCount = 1; // Initialize with 1 portion
  int _initialPrice = 200; // Initialize with your initial price
  int _totalPrice = 200; // Total price

  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: Helper.getScreenHeight(context) * 0.5,
                          width: Helper.getScreenWidth(context),
                          child: Image.asset(
                            Helper.getAssetName("pizza.jpg", "real"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: Helper.getScreenHeight(context) * 0.5,
                          width: Helper.getScreenWidth(context),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.0, 0.4],
                              colors: [
                                Colors.black.withOpacity(0.9),
                                Colors.black.withOpacity(0.0),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SafeArea(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                                Image.asset(
                                  Helper.getAssetName(
                                      "cart_white.png", "virtual"),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Helper.getScreenHeight(context) * 0.35,
                          ),
                          SizedBox(
                            height: 800,
                            width: double.infinity,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Container(
                                    height: 700,
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 30),
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(40),
                                          topRight: Radius.circular(40),
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Text(
                                            "Hot & Sour Pizza",
                                            style: Helper.getTheme(context)
                                                .headlineSmall,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 20),
                                                        child:
                                                            RatingBar.builder(
                                                          initialRating:
                                                              4, // Set the initial rating here
                                                          minRating: 1,
                                                          direction:
                                                              Axis.horizontal,
                                                          allowHalfRating:
                                                              false,
                                                          itemCount: 5,
                                                          itemSize:
                                                              20.0, // Adjust the size of the stars as needed
                                                          itemBuilder:
                                                              (context, _) =>
                                                                  Icon(
                                                            Icons.star,
                                                            color: Colors.amber,
                                                          ),
                                                          onRatingUpdate:
                                                              (rating) {
                                                            // Handle the updated rating (you can save it to a variable or perform any action)
                                                            print(
                                                                "New Rating: $rating");
                                                          },
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "4 Star Ratings",
                                                    style: TextStyle(
                                                      color: AppColor.orange,
                                                      fontSize: 12,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      "Rs. 800",
                                                      style: TextStyle(
                                                        color: AppColor.primary,
                                                        fontSize: 30,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    Text("/per Portion")
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Text(
                                            "Description",
                                            style: Helper.getTheme(context)
                                                .headlineMedium!
                                                .copyWith(
                                                  fontSize: 16,
                                                ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Text(
                                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare leo non mollis id cursus. Eu euismod faucibus in leo malesuada"),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Divider(
                                            color: AppColor.placeholder,
                                            thickness: 1.5,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Text(
                                            "Customize your Order",
                                            style: Helper.getTheme(context)
                                                .headlineMedium!
                                                .copyWith(
                                                  fontSize: 16,
                                                ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 50,
          width: double.infinity,
          padding: const EdgeInsets.only(left: 30, right: 10),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            color: AppColor.placeholderBg,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: Row(
                children: [
                  Text("-Select the size of portion-"),
                ],
              ),
              value: _selectedSize1, // Set the selected value here
              onChanged: (newValue) {
                setState(() {
                  _selectedSize1 = newValue; // Update the selected value
                });
              },
              items: [
                DropdownMenuItem(
                  child: Text("-Select the size of portion-"),
                  value: null,
                ),
                DropdownMenuItem(
                  child: Text("Small"),
                  value: "Small", // You can set the value to the option text
                ),
                DropdownMenuItem(
                  child: Text("Medium"),
                  value: "Medium",
                ),
                DropdownMenuItem(
                  child: Text("Large"),
                  value: "Large",
                ),
                // Add more options as needed
              ],
              icon: Image.asset(
                Helper.getAssetName(
                  "dropdown.png",
                  "virtual",
                ),
              ),
            ),
          ),
        ),
      ),
// In this code, I've added three options: "Pepperoni," "Salty," and "Cheesy." You can add more options by creating additional DropdownMenuItem widgets within the items list. When the user selects an option, the onChanged callback will be called with the selected value, allowing you to perform actions based on the user's selection.






                                        SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 50,
          width: double.infinity,
          padding: const EdgeInsets.only(left: 30, right: 10),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            color: AppColor.placeholderBg,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: Row(
                children: [
                  Text("-Select the size of Ingredients-"),
                ],
              ),
              value: _selectedSize2, // Set the selected value here
              onChanged: (newValue) {
                setState(() {
                  _selectedSize2 = newValue; // Update the selected value
                });
              },
              items: [
                DropdownMenuItem(
                  child: Text("-Select the size of Ingredients-"),
                  value: null,
                ),
                DropdownMenuItem(
                  child: Text("Pepperoni"),
                  value: "Pepperoni", // You can set the value to the option text
                ),
                DropdownMenuItem(
                  child: Text("Salty"),
                  value: "Salty",
                ),
                DropdownMenuItem(
                  child: Text("Cheesy"),
                  value: "Cheesy",
                ),
                // Add more options as needed
              ],
              icon: Image.asset(
                Helper.getAssetName(
                  "dropdown.png",
                  "virtual",
                ),
              ),
            ),
          ),
        ),
      ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Number of Portions",
                  style: Helper.getTheme(context)
                      .headlineMedium!
                      .copyWith(
                        fontSize: 16,
                      ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(5.0),
                        ),
                        onPressed: () {
                          setState(() {
                            if (_portionCount > 1) {
                              _portionCount--;
                              _totalPrice = _initialPrice * _portionCount;
                            }
                          });
                        },
                        child: Text("-"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 35,
                        width: 55,
                        decoration: ShapeDecoration(
                          shape: StadiumBorder(
                            side: BorderSide(
                              color: AppColor.orange,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$_portionCount",
                              style: TextStyle(
                                color: AppColor.orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(5.0),
                        ),
                        onPressed: () {
                          setState(() {
                            _portionCount++;
                            _totalPrice = _initialPrice * _portionCount;
                          });
                        },
                        child: Text("+"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
                                        SizedBox(
        height: 200,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              width: 200,
              decoration: ShapeDecoration(
                color: AppColor.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Container(
                  height: 160,
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                    left: 50,
                    right: 40,
                  ),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    shadows: [
                      BoxShadow(
                        color: AppColor.placeholder.withOpacity(0.3),
                        offset: Offset(0, 5),
                        blurRadius: 5,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Total Price"),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Rs $_totalPrice", // Display total price with currency
                        style: TextStyle(
                          color: AppColor.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                Helper.getAssetName(
                                    "add_to_cart.png", "virtual"),
                              ),
                              Text("Add to Cart"),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shadows: [
                      BoxShadow(
                        color: AppColor.placeholder.withOpacity(0.3),
                        offset: Offset(0, 5),
                        blurRadius: 5,
                      ),
                    ],
                    shape: CircleBorder(),
                  ),
                  child: Image.asset(
                    Helper.getAssetName("cart_filled.png", "virtual"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 20,
                                  ),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: ClipShadow(
                                      clipper: CustomTriangle(),
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColor.placeholder,
                                          offset: Offset(0, 5),
                                          blurRadius: 5,
                                        ),
                                      ],
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        color: Colors.white,
                                        child: Image.asset(
                                          Helper.getAssetName(
                                            "fav_filled.png",
                                            "virtual",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(),
          ),
        ],
      ),
    );
  }
}

class CustomTriangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Offset controlpoint = Offset(size.width * 0, size.height * 0.5);
    Offset endpoint = Offset(size.width * 0.2, size.height * 0.85);
    Offset controlpoint2 = Offset(size.width * 0.33, size.height);
    Offset endpoint2 = Offset(size.width * 0.6, size.height * 0.9);
    Offset controlpoint3 = Offset(size.width * 1.4, size.height * 0.5);
    Offset endpoint3 = Offset(size.width * 0.6, size.height * 0.1);
    Offset controlpoint4 = Offset(size.width * 0.33, size.height * 0);
    Offset endpoint4 = Offset(size.width * 0.2, size.height * 0.15);

    Path path = new Path()
      ..moveTo(size.width * 0.2, size.height * 0.15)
      ..quadraticBezierTo(
        controlpoint.dx,
        controlpoint.dy,
        endpoint.dx,
        endpoint.dy,
      )
      ..quadraticBezierTo(
        controlpoint2.dx,
        controlpoint2.dy,
        endpoint2.dx,
        endpoint2.dy,
      )
      ..quadraticBezierTo(
        controlpoint3.dx,
        controlpoint3.dy,
        endpoint3.dx,
        endpoint3.dy,
      )
      ..quadraticBezierTo(
        controlpoint4.dx,
        controlpoint4.dy,
        endpoint4.dx,
        endpoint4.dy,
      );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
