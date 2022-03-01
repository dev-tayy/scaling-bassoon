import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

class DFISpinner extends StatelessWidget {
  const DFISpinner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('assets/spinner.json'),
    );
  }
}

class DFILoader {
  static show(BuildContext context) {
    return Loader.show(context,
        progressIndicator: const DFISpinner(), overlayColor: Colors.white30);
  }

  static hide() {
    return Loader.hide();
  }
}
