import 'package:flutter/cupertino.dart';

import '../../main.dart';

class NoDataPage extends StatelessWidget {
  const NoDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset(imageData.notFoundImage));
  }
}
