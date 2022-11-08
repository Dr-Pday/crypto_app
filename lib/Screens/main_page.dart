import 'package:crypto_app/Screens/second_page.dart';
import 'package:crypto_app/data/api_datas_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Crypto>? crypto;
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 100,
      color: Colors.red,
      child: Text(''),
    );
  }

  void getData() async {
    var response = await Dio().get('https://api.coincap.io/v2/assets');

    List<Crypto> cryptoList = response.data['data']
        .map<Crypto>((jsonMapObject) => Crypto.fromMapJson(jsonMapObject))
        .toList();

    print(cryptoList[4].name);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CryptoPage(),
      ),
    );
  }
}
