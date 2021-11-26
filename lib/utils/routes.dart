import 'package:flutter/material.dart';

import 'package:saccoapp/auth/login.dart';
import 'package:saccoapp/screens/dashboard.dart';
import 'package:saccoapp/screens/deposits.dart';
import 'package:saccoapp/screens/addresses.dart';
import 'package:saccoapp/screens/loans.dart';
import 'package:saccoapp/screens/paymentdetails.dart';
import 'package:saccoapp/screens/adddeposit.dart';

final routes = <String, WidgetBuilder>{
  '/login': (BuildContext context) => Login(),
  '/home': (BuildContext context) => Dashboard(),
  '/deposits': (BuildContext context) => Deposits(),
  '/addresses': (BuildContext context) => Addresses(),
  '/loans': (BuildContext context) => Loans(),
  '/paymentdetails': (BuildContext context) => PaymentDetails(),
  '/adddeposit': (BuildContext context) => AddDeposit(),
};
