import 'package:flutter/material.dart';
import 'dart:math';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class NetworkResponse {
  int statusCode;

  NetworkResponse(this.statusCode);
}

class UiState {
  String message;

  UiState(this.message);
}

class NetworkHandler extends ChangeNotifier {
  NetworkResponse response = NetworkResponse(0);

  void callNetwork() {
    int n = Random().nextInt(100) % 2;
    int code = 400;
    switch (n) {
      case 0:
        code = 200;
        break;
      case 1:
        code = 400;
        break;
    }
    response = NetworkResponse(code);
    notifyListeners();
  }
}

class ViewModel extends ChangeNotifier {
  UiState uiState = UiState("Call Network to load data ");

  void update(NetworkResponse response) {
    switch (response.statusCode) {
      case 200:
        uiState = UiState("Success response");
        break;
      case 400:
        uiState = UiState('Failure response');
    }
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NetworkHandler networkHandler = NetworkHandler();
    ViewModel viewModel = ViewModel();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Change notidier proxy ex 2'),),
        body: Center(
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider.value(value: networkHandler),
              ChangeNotifierProxyProvider<NetworkHandler, ViewModel>(
                create: (context) => viewModel,
                update: (context, value, previous) {
                  viewModel.update(value.response);
                  return viewModel;
                },
              ),
            ],
            child: Center(
              child: Column(
                children: [
                  Consumer<ViewModel>(
                    builder: (context, value, child) {
                      return Text(value.uiState.message);
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        networkHandler.callNetwork();
                      },
                      child: Text('Call network')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}