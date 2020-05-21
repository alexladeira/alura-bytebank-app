import 'package:bytebank/screens/contact_list.dart';
import 'package:bytebank/screens/transactions_list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: LayoutBuilder(
        builder: (context, coinstraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: coinstraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset('images/bytebank_logo.png'),
                    Container(
                      height: 120,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          FeatureItem(
                            'Transfer',
                            Icons.monetization_on,
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ContactList(),
                            )),
                          ),
                          FeatureItem(
                            'Transaction feed',
                            Icons.description,
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TransactionsList(),
                            )),
                          ),
                        ],
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onTap;

  FeatureItem(this.name, this.icon, {@required this.onTap})
      : assert(icon != null),
        assert(onTap != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () => onTap(),
          child: Container(
            width: 150,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  Text(
                    name,
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
