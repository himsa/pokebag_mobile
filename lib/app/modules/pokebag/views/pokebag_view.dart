import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pokebag_controller.dart';

class PokebagView extends GetView<PokebagController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PokebagView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PokebagView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
