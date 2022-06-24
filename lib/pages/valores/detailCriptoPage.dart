import 'package:flutter/material.dart';

import 'detailCriptoBsn.dart';

class DetailCriptoPage extends StatefulWidget {
  DetailCriptoPage({Key? key}) : super(key: key);

  @override
  State<DetailCriptoPage> createState() => _DetailCriptoPageState();
}

class _DetailCriptoPageState extends State<DetailCriptoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Container(
                  child: Center(
                    child: Text(
                      DetailCriptoBsn.title,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      DetailCriptoBsn.symbol,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      DetailCriptoBsn.urlimagen,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      'TwitterFollowers: '+DetailCriptoBsn.twitterfollowers,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      'Valor BTC: ' + DetailCriptoBsn.valorbtc,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      'Valor USD: ' + DetailCriptoBsn.valorusd,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
          ],
        )
      ),
    );
  }
}