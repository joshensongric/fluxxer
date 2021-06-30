import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../phoneauth/phoneauth_widget.dart';
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
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.asset(
                                'assets/images/Profile-Image-White.png',
                                width: 100,
                                height: 300,
                                fit: BoxFit.fitWidth,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xFFEDEDED),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment(0, 0),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 20, 10),
                                    child: Text(
                                      'Login',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.title3.override(
                                        fontFamily: 'Quicksand',
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    height: 1,
                                    thickness: 2,
                                    indent: 80,
                                    endIndent: 80,
                                    color: FlutterFlowTheme.secondaryColor,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(20, 40, 20, 20),
                                    child: Container(
                                      width: 300,
                                      constraints: BoxConstraints(
                                        maxWidth: 30,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0x2F16CB79),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 0, 20, 0),
                                        child: TextFormField(
                                          onChanged: (_) => setState(() {}),
                                          controller: textController,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'mobile',
                                            hintStyle: FlutterFlowTheme
                                                .subtitle2
                                                .override(
                                              fontFamily: 'Poppins',
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            suffixIcon:
                                                textController.text.isNotEmpty
                                                    ? InkWell(
                                                        onTap: () => setState(
                                                          () => textController
                                                              .clear(),
                                                        ),
                                                        child: Icon(
                                                          Icons.clear,
                                                          color: FlutterFlowTheme
                                                              .secondaryColor,
                                                          size: 22,
                                                        ),
                                                      )
                                                    : null,
                                          ),
                                          style: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Poppins',
                                          ),
                                          textAlign: TextAlign.start,
                                          keyboardType: TextInputType.phone,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(20, 20, 20, 10),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (textController.text.isEmpty ||
                                            !textController.text
                                                .startsWith('+')) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  'Phone Number is required and has to start with +.'),
                                            ),
                                          );
                                          return;
                                        }
                                        await beginPhoneAuth(
                                          context: context,
                                          phoneNumber: textController.text,
                                          onCodeSent: () async {
                                            await Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    PhoneauthWidget(),
                                              ),
                                              (r) => false,
                                            );
                                          },
                                        );
                                      },
                                      text: 'Get started',
                                      options: FFButtonOptions(
                                        width: 300,
                                        height: 50,
                                        color: FlutterFlowTheme.primaryColor,
                                        textStyle: GoogleFonts.getFont(
                                          'Quicksand',
                                          color: FlutterFlowTheme.tertiaryColor,
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
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment(0.9, 0.7),
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
                  expansionFactor: 4,
                  spacing: 10,
                  radius: 16,
                  dotWidth: 16,
                  dotHeight: 16,
                  dotColor: FlutterFlowTheme.tertiaryColor,
                  activeDotColor: FlutterFlowTheme.secondaryColor,
                  paintStyle: PaintingStyle.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
