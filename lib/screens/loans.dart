import 'package:flutter/material.dart';

import 'package:saccoapp/partials/drawer.dart';
import 'package:saccoapp/utils/api.dart';
import 'package:saccoapp/models/loan/memberloan.dart';

class Loans extends StatefulWidget {
  @override
  LoanScreen createState() => LoanScreen();
}

class LoanScreen extends State<Loans> {
  final SaccoAPI api = new SaccoAPI();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Loans'),
      ),
      drawer: SaccoDrawer(),
      body: FutureBuilder<List<MemberLoan>>(
        future: api.fetchLoans(),
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
                            leading:
                                Text('${snapshot.data[index].memberLoanId}'),
                            title: Text('${snapshot.data[index].loanAmount}'),
                            subtitle:
                                Text('${snapshot.data[index].loanPurpose}'),
                          ),
                          ListTile(
                            leading: Icon(Icons.place),
                            title:
                                Text('${snapshot.data[index].repaymentPeriod}'),
                            subtitle: Text(
                                '${snapshot.data[index].loanRepaymentStatus.loanRepaymentStatus}, ${snapshot.data[index].loanRepaymentStatus.loanRepaymentStatus}'),
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
