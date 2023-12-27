import 'package:flutter/material.dart';
import '../const/colors.dart';
import '../utils/helper.dart';
import '../widgets/customNavBar.dart';


class InboxScreen extends StatelessWidget {
  static const routeName = "/inboxScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.arrow_back_ios_rounded),
                      ),
                      Expanded(
                        child: Text(
                          "Inbox",
                          style: Helper.getTheme(context).headlineSmall,
                        ),
                      ),
                      Image.asset(
                        Helper.getAssetName("cart.png", "virtual"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                MailCard(
                  title: "FoodPlace Promotions",
                  description:
                      "🍟 Monday Madness: Kickstart your week with a FREE side dish of your choice with any main course purchase. (Valid every Monday from 11 AM to 3 PM)",
                  time: "6th July",
                ),
                MailCard(
                  title: "FoodPlace Promotions",
                  description:
                      "🍕 Two-for-Tuesday: Buy any large pizza and get a second one at 50% OFF! Perfect for a midweek pizza party. (Available every Tuesday after 4 PM)",
                  time: "6th August",
                  color: AppColor.placeholderBg,
                ),
                MailCard(
                  title: "FoodPlace Promotions",
                  description:
                      "🍔 Burger Bonanza: Grab your favorite burger and receive a FREE upgrade to a premium side with any burger purchase every Thursday!",
                  time: "10th December",
                ),
                MailCard(
                  title: "FoodPlace Promotions",
                  description:
                      "🍝 Family Feast Sunday: Treat your loved ones to a hearty meal with our family-sized pasta dishes at 25% OFF every Sunday.",
                  time: "25th January",
                ),
                MailCard(
                  title: "FoodPlace Promotions",
                  description:
                      "🥗 Healthy Fridays: Opt for a lighter option on Fridays with 15% OFF on all our fresh salads. Start your weekend on a nutritious note",
                  time: "12th July",
                  color: AppColor.placeholderBg,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(
              menu: true,
            ),
          ),
        ],
      ),
    );
  }
}

class MailCard extends StatelessWidget {
  const MailCard({
    Key? key,
    required String time,
    required String title,
    required String description,
    Color color = Colors.white,
  })  : _time = time,
        _title = title,
        _description = description,
        _color = color,
        super(key: key);

  final String _time;
  final String _title;
  final String _description;
  final Color _color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: _color,
        border: Border(
          bottom: BorderSide(
            color: AppColor.placeholder,
            width:0.5,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: AppColor.orange,
            radius: 5,
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _title,
                  style: TextStyle(
                    color: AppColor.primary,
                  ),
                ),
                SizedBox(height: 5),
                Text(_description),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _time,
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              Image.asset(Helper.getAssetName("star.png", "virtual"))
            ],
          ),
        ],
      ),
    );
  }
}
