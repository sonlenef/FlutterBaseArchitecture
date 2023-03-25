import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/ui/home/home_bloc.dart';
import 'package:flutter_base_architecture/util/extensions/define.dart';
import 'package:provider/provider.dart';

import '../base/define.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends BaseState<HomePage, HomeBloc> {
  @override
  void initState() {
    super.initState();
    bloc.streamCount.listen((count) {
      if (kDebugMode) {
        print("Click count $count");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bloc.streamCount.listen((count) {
      context.showSnackBar("Click count $count");
    });
    return ChangeNotifierProvider(
      create: (_) => bloc,
      child: Scaffold(
        body: Center(
          child: TextButton(
            child: const Text('Click me!'),
            onPressed: () => bloc.funcClick(),
          ),
        ),
      ),
    );
  }
}
