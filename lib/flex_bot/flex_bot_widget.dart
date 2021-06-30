import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlexBotWidget extends StatefulWidget {
  FlexBotWidget({Key key}) : super(key: key);

  @override
  _FlexBotWidgetState createState() => _FlexBotWidgetState();
}

class _FlexBotWidgetState extends State<FlexBotWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: FlutterFlowWebView(
          url: 'https://mishushakov.github.io/dialogflow-web-v2/',
          bypass: false,
          width: MediaQuery.of(context).size.width,
          verticalScroll: true,
          horizontalScroll: false,
        ),
      ),
    );
  }
}
