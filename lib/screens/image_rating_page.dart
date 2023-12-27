import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ImageRatingPage extends StatefulWidget {
  final String imageAsset;
  final String title;
  final String description;

  ImageRatingPage({
    required this.imageAsset,
    required this.title,
    required this.description,
  });
   @override
   _ImageRatingPageState createState() => _ImageRatingPageState();
}

class _ImageRatingPageState extends State<ImageRatingPage> {
  double _rating = 3.0; // Initial rating value
  int _numberOfPortions = 1; // Initial number of portions
  double _initialPrice = 750.0; // Initial price of the pizza
  double _totalPrice = 750.0; // Initial total price

  String? _selectedIngredient; // Initial selected ingredient is null

  void _incrementPortions() {
    setState(() {
      _numberOfPortions++;
      _updateTotalPrice();
    });
  }

  void _decrementPortions() {
    if (_numberOfPortions > 1) {
      setState(() {
        _numberOfPortions--;
        _updateTotalPrice();
      });
    }
  }

  void _updateTotalPrice() {
    // Calculate the total price based on the initial price and the number of portions
    _totalPrice = _initialPrice * _numberOfPortions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Display the image above the title
         
          // Display the title of the image below the image and on the left
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title of the Image',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'RS.750',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                // Add any additional widgets here on the right side if needed
              ],
            ),
          ),

          // Display the star rating below the title
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
            child: RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemSize: 40.0,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
          ),

          // Display the description of the image in small letters
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Description of the image goes here.',
              style: TextStyle(fontSize: 14.0),
            ),
          ),

          // Display a thin line below the description
          Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey,
            margin: EdgeInsets.symmetric(horizontal: 16.0),
          ),

          // "Customize Your Order" text
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Customize Your Order',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),

          // Dropdown menu for selecting ingredients
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButton<String>(
              hint: Text('Select the Ingredients'), // Displayed when no item is selected
              value: _selectedIngredient,
              onChanged: (newValue) {
                setState(() {
                  _selectedIngredient = newValue!;
                });
              },
              items: <String>[
                'Pepperoni',
                'Capsicum',
                'Salty',
                'Cheesy',
                // Add more ingredients as needed
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),

          // "Number of Portions" text
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Number of Portions',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),

          // Increment and Decrement buttons for the number of portions
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _decrementPortions,
                child: Icon(Icons.remove),
              ),
              SizedBox(
                width: 16.0,
              ),
              Text(
                '$_numberOfPortions',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 16.0,
              ),
              ElevatedButton(
                onPressed: _incrementPortions,
                child: Icon(Icons.add),
              ),
            ],
          ),

          // Thin line below the increment and decrement buttons
          Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey,
            margin: EdgeInsets.symmetric(horizontal: 16.0),
          ),

          // "Total Price" text
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total Price: RS. $_totalPrice',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),

          // "Add to Cart" button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                // Add functionality for the "Add to Cart" button
              },
              icon: Icon(Icons.shopping_cart),
              label: Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }
}
