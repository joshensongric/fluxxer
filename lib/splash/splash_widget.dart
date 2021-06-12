import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../login/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashWidget extends StatefulWidget {
  SplashWidget({Key key}) : super(key: key);

  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  final pageViewController = PageController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF16CB79),
      body: Align(
        alignment: Alignment(0, -0.05),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 1),
                child: PageView(
                  controller: pageViewController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Align(
                      alignment: Alignment(0, -0.6),
                      child: Text(
                        'Flex Money',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Quicksand',
                          color: Colors.white,
                          fontSize: 42,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, -0.35),
                      child: Text(
                        'Flex Life',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Quicksand',
                          color: Colors.white,
                          fontSize: 42,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.bottomToTop,
                            duration: Duration(milliseconds: 300),
                            reverseDuration: Duration(milliseconds: 300),
                            child: LoginWidget(),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/images/FT Splash Screen.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment(0.1, 0.9),
                child: SmoothPageIndicator(
                  controller: pageViewController,
                  count: 3,
                  axisDirection: Axis.horizontal,
                  onDotClicked: (i) {
                    pageViewController.animateToPage(
                      i,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  effect: ExpandingDotsEffect(
                    expansionFactor: 2,
                    spacing: 15,
                    radius: 16,
                    dotWidth: 16,
                    dotHeight: 16,
                    dotColor: Color(0xFFFAFAFA),
                    activeDotColor: FlutterFlowTheme.secondaryColor,
                    paintStyle: PaintingStyle.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
