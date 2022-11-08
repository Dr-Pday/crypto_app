import 'package:crypto_app/data/api_datas_model.dart';
import 'package:flutter/material.dart';

class CryptoPage extends StatefulWidget {
   CryptoPage({super.key,this.crypto});

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
    return MaterialApp();
  }
}
