import 'package:crypto_app/data/api_datas_model.dart';
import 'package:crypto_app/data/constants/contants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CryptoPage extends StatefulWidget {
  CryptoPage({super.key, this.crypto});
  List<Crypto>? crypto;

  @override
  State<CryptoPage> createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  List<Crypto>? crypto;

  @override
  void initState() {
    super.initState();
    crypto = widget.crypto;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: greyColor,
        appBar: AppBar(
          backgroundColor: darkBlueColor,
          title: Text(
            'بازار کریپتو',
            style: TextStyle(
                color: greyColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'moraba'),
          ),
        ),
        body: SafeArea(
          child: RefreshIndicator(
            backgroundColor: greyColor,
            color: greenColor,
            onRefresh: () async {
              List<Crypto> freshData = await getData();
              setState(() {
                crypto = freshData;
              });
            },
            child: ListView.builder(
              itemCount: crypto!.length,
              itemBuilder: (BuildContext context, int index) {
                return _getListTile(crypto![index]);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _getIconColor(getPercent) {
    return getPercent <= 0
        ? Icon(Icons.trending_down, color: redColor)
        : Icon(Icons.trending_up, color: greenColor);
  }

  Widget _getListTile(Crypto crypto) {
    return ListTile(
      leading: SizedBox(
        width: 30,
        child: Center(
          child: Text(
            crypto.rank.toString(),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      title: Text(
        crypto.name,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        crypto.symbol,
        style: TextStyle(fontSize: 10, color: Colors.grey),
      ),
      trailing: SizedBox(
        width: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  crypto.priceUsd.toStringAsFixed(2),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  crypto.changePercent24Hr.toStringAsFixed(2) + '%',
                  style: TextStyle(
                      fontSize: 10,
                      color: crypto.changePercent24Hr <= 0
                          ? redColor
                          : greenColor),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(
              width: 40,
              child: _getIconColor(crypto.changePercent24Hr),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColorChange(double changePercent) {
    return changePercent <= 0 ? redColor : greenColor;
  }

  Future<List<Crypto>> getData() async {
    var response = await Dio().get('https://api.coincap.io/v2/assets');

    List<Crypto> cryptoList = response.data['data']
        .map<Crypto>((jsonMapObject) => Crypto.fromMapJson(jsonMapObject))
        .toList();

    return cryptoList;
  }
}
