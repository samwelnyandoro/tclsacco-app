import 'package:flutter/material.dart';

import 'package:saccoapp/partials/drawer.dart';
import 'package:saccoapp/models/deposit/deposit.dart';
import 'package:saccoapp/utils/api.dart';

class Deposits extends StatefulWidget {
  @override
  DepositScreen createState() => DepositScreen();
}

class DepositScreen extends State<Deposits> {
  final SaccoAPI api = new SaccoAPI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Deposits'),
      ),
      drawer: SaccoDrawer(),
      body: FutureBuilder<List<Deposit>>(
        future: api.fetchDeposits(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text('${snapshot.data[index].memberDepositId}'),
                      title: Text(
                          'Amount: ${snapshot.data[index].depositAmount} KES'),
                      subtitle: Text(
                          'Paid On: ${DateTime.parse(snapshot.data[index].createdAt)}'),
                    );
                  },
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
