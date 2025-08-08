import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/bloc/center_widget.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 100, width: 100, child: CenterWidget());
  }
}
