import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/terakhir_dibaca_controller.dart';

class TerakhirDibacaView extends GetView<TerakhirDibacaController> {
  const TerakhirDibacaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terakhir Dibaca'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Terakhir Dibaca',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
