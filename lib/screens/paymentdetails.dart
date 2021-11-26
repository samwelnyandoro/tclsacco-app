import 'package:flutter/material.dart';

import 'package:saccoapp/partials/drawer.dart';
import 'package:saccoapp/utils/api.dart';
import 'package:saccoapp/models/payment/paymentdetail.dart';

class PaymentDetails extends StatefulWidget {
  @override
  PaymentDetailScreen createState() => PaymentDetailScreen();
}

class PaymentDetailScreen extends State<PaymentDetails> {
  final SaccoAPI api = new SaccoAPI();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Payment Details'),
      ),
      drawer: SaccoDrawer(),
      body: FutureBuilder<List<PaymentDetail>>(
        future: api.fetchPaymentDetails(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.account_balance_wallet),
                            title: Text(
                                '${snapshot.data[index].paymentMethod.paymentMethod}'),
                            subtitle: Text(
                                '${snapshot.data[index].paymentDetailsId}'),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
