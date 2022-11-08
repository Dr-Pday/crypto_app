import 'package:crypto_app/Screens/second_page.dart';
import 'package:crypto_app/data/api_datas_model.dart';
import 'package:crypto_app/data/constants/contants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 200,
            height: 200,
          ),
          // Image(
          //   width: 200,
          //   height: 200,
          //   image: AssetImage('assets/images/logo.png'),
          // ),
          SizedBox(
            height: 50,
          ),
          SpinKitFadingFour(
            color: darkBlueColor,
            size: 40,
          ),
        ],
      ),
    );
  }

  Future<void> getData() async {
    var response = await Dio().get('https://api.coincap.io/v2/assets');

    List<Crypto> cryptoList = response.data['data']
        .map<Crypto>((jsonMapObject) => Crypto.fromMapJson(jsonMapObject))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CryptoPage(crypto: cryptoList),
      ),
    );
  }
}
