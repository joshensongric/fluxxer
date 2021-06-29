import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashWidget extends StatefulWidget {
  SplashWidget({Key key}) : super(key: key);

  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  TextEditingController textController;
  final pageViewController = PageController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.primaryColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            PageView(
              controller: pageViewController,
              scrollDirection: Axis.vertical,
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment(0, -0.75),
                      child: Text(
                        'welcome to #flexLife',
                        style: FlutterFlowTheme.title1.override(
                          fontFamily: 'Quicksand',
                          color: FlutterFlowTheme.tertiaryColor,
                          fontSize: 32,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0.4),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 30,
                                color: Color(0x510E5347),
                                offset: Offset(0, 0),
                                spreadRadius: 0,
                              )
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/animation_300_kqg9nkgx.gif',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment(0, -0.75),
                      child: AutoSizeText(
                        'flex money',
                        style: FlutterFlowTheme.title1.override(
                          fontFamily: 'Quicksand',
                          color: FlutterFlowTheme.tertiaryColor,
                          fontSize: 32,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0.4),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 30,
                                color: Color(0x500E5347),
                                offset: Offset(0, 0),
                                spreadRadius: 0,
                              )
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/animation_500_kqgajj2t.gif',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment(0, -0.75),
                      child: AutoSizeText(
                        'flex together',
                        style: FlutterFlowTheme.title1.override(
                          fontFamily: 'Quicksand',
                          color: FlutterFlowTheme.tertiaryColor,
                          fontSize: 32,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0.4),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 30,
                                color: Color(0x500E5347),
                                offset: Offset(0, 0),
                                spreadRadius: 0,
                              )
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/animation_500_kqgay88t.gif',
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Image.asset(
                          'assets/images/FT Splash Screen.png',
                          width: 100,
                          height: MediaQuery.of(context).size.height * 0.25,
                          fit: BoxFit.none,
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 9,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Stack(
                            alignment: Alignment(0, 0),
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(60, 60, 60, 60),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(4, 0, 0, 20),
                                          child: Container(
                                            width: 300,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFE0E0E0),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  20, 0, 20, 0),
                                              child: TextFormField(
                                                controller: textController,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText: 'mobile',
                                                  hintStyle:
                                                      GoogleFonts.getFont(
                                                    'Open Sans',
                                                    color: Color(0xFF455A64),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                ),
                                                style: GoogleFonts.getFont(
                                                  'Open Sans',
                                                  color: Color(0xFF455A64),
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 0, 20),
                                          child: FFButtonWidget(
                                            onPressed: () {
                                              print('Button pressed ...');
                                            },
                                            text: 'Get started',
                                            options: FFButtonOptions(
                                              width: 300,
                                              height: 50,
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                              textStyle: GoogleFonts.getFont(
                                                'Quicksand',
                                                color: FlutterFlowTheme
                                                    .tertiaryColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                              ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 0,
                                              ),
                                              borderRadius: 25,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment(0, -0.65),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 4, 0, 0),
                                        child: Image.asset(
                                          'assets/images/Flex Together LOGO (1024).png',
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment(0.9, 0.75),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: SmoothPageIndicator(
                  controller: pageViewController,
                  count: 4,
                  axisDirection: Axis.vertical,
                  onDotClicked: (i) {
                    pageViewController.animateToPage(
                      i,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  effect: ExpandingDotsEffect(
                    expansionFactor: 2,
                    spacing: 8,
                    radius: 16,
                    dotWidth: 16,
                    dotHeight: 16,
                    dotColor: FlutterFlowTheme.tertiaryColor,
                    activeDotColor: FlutterFlowTheme.secondaryColor,
                    paintStyle: PaintingStyle.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
