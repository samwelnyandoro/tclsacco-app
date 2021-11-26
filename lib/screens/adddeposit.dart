import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:saccoapp/partials/drawer.dart';
import 'package:saccoapp/utils/api.dart';
import 'package:saccoapp/models/deposit/mpesastkpushresponse.dart';

class AddDeposit extends StatefulWidget {
  @override
  AddDepositScreen createState() => AddDepositScreen();
}

class AddDepositScreen extends State<AddDeposit> {
  SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text('Add Deposit'),
        ),
        drawer: SaccoDrawer(),
        body: ShowForm());
  }
}

class ShowForm extends StatefulWidget {
  @override
  ShowDepForm createState() => ShowDepForm();
}

class ShowDepForm extends State<ShowForm> {
  final SaccoAPI api = new SaccoAPI();
  final _addDepositFormKey = GlobalKey<FormState>();
  String depositAmount;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Form(
        key: _addDepositFormKey,
        child: Container(
            color: Theme.of(context).backgroundColor,
            padding: EdgeInsets.all(20.0),
            child: ListView(children: <Widget>[
              TextFormField(
                decoration:
                    InputDecoration(hintText: 'Amount', labelText: 'Amount'),
                validator: _validateAmount,
                onSaved: (String amount) {
                  depositAmount = amount;
                },
              ),
              Container(
                  width: screenSize.width,
                  child: RaisedButton(
                    color: Theme.of(context).buttonColor,
                    onPressed: addMpesaDeposit,
                    child: Text(
                      'Deposit With Mpesa',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ])));
  }

  void addMpesaDeposit() {
    if (_addDepositFormKey.currentState.validate()) {
      _addDepositFormKey.currentState.save();
      api.mpesaDeposit(depositAmount).then((result) {
        if (result is MpesaSTKResponse) {
          if (result.responseCode == "0") {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('Success! Please wait to enter your pin.'),
              action: SnackBarAction(
                label: 'View Deposits',
                onPressed: goToDeposits,
              ),
            ));
          } else {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('${result.customerMessage}'),
            ));
          }
        } else {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(
                'Unable to process your payment at this time. Please try again later'),
          ));
        }
      });
    }
  }

  String _validateAmount(String value) {
    if (value.length >= 0 && int.parse(value) != 0) {
      return null;
    }

    return 'Please input an amount';
  }

  void goToDeposits() {
    Navigator.pushNamed(context, '/deposits');
  }
}
