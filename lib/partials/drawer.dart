import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transparent_image/transparent_image.dart';

class SaccoDrawer extends StatefulWidget {
  @override
  _SaccoDrawerState createState() => _SaccoDrawerState();
}

class _SaccoDrawerState extends State<SaccoDrawer> {
  SharedPreferences prefs;
  String firstName, lastName, email, phoneNumber, passportPhoto;

  @override
  void initState() {
    super.initState();
    getPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
            child: UserAccountsDrawerHeader(
          accountName: Text('$lastName, $firstName'),
          accountEmail: Text('$email'),
          currentAccountPicture: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: '$passportPhoto',
          ),
          margin: EdgeInsets.zero,
        )),
        ListTile(
          title: Text('Dashboard'),
          onTap: () {
            Navigator.pushNamed(context, '/home');
          },
          leading: const Icon(Icons.dashboard),
        ),
        ListTile(
          title: Text('Add Deposit'),
          onTap: () {
            Navigator.pushNamed(context, '/adddeposit');
          },
          leading: const Icon(Icons.add),
        ),
        ListTile(
          title: Text('Deposits'),
          onTap: () {
            Navigator.pushNamed(context, '/deposits');
          },
          leading: const Icon(Icons.monetization_on),
        ),
        ListTile(
          title: Text('Loans'),
          onTap: () {
            Navigator.pushNamed(context, '/loans');
          },
          leading: const Icon(Icons.assignment_turned_in),
        ),
        ListTile(
          title: Text('Addresses'),
          onTap: () {
            Navigator.pushNamed(context, '/addresses');
          },
          leading: const Icon(Icons.place),
        ),
        ListTile(
          title: Text('Payment Details'),
          onTap: () {
            Navigator.pushNamed(context, '/paymentdetails');
          },
          leading: const Icon(Icons.account_balance_wallet),
        ),
        ListTile(
          title: Text('Log Out'),
          onTap: () {
            clearPrefs();
            Navigator.pushReplacementNamed(context, '/');
          },
          leading: const Icon(Icons.power_settings_new),
        ),
      ],
    ));
  }

  void clearPrefs() async {
    prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  getPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      firstName = prefs.getString('firstName');
      lastName = prefs.getString('lastName');
      email = prefs.getString('email');
      phoneNumber = prefs.getString('phoneNumber');
      passportPhoto = prefs.getString('profilePhoto');
    });
  }
}
