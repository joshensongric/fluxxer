import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneauthWidget extends StatefulWidget {
  PhoneauthWidget({Key key}) : super(key: key);

  @override
  _PhoneauthWidgetState createState() => _PhoneauthWidgetState();
}

class _PhoneauthWidgetState extends State<PhoneauthWidget> {
  TextEditingController textController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: Alignment(0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(50, 100, 50, 100),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                          ),
                          child: Image.asset(
                            'assets/images/FT Logo Square (1024 - white).png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                      child: Text(
                        'Verify SMS',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.secondaryColor,
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                          shape: BoxShape.rectangle,
                        ),
                        child: Align(
                          alignment: Alignment(0, 1),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                            child: TextFormField(
                              onChanged: (_) => setState(() {}),
                              controller: textController,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'xxxxxx',
                                hintStyle: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Quicksand',
                                  color: Color(0xFF696871),
                                  fontSize: 32,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF0E5347),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF0E5347),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                filled: true,
                                fillColor: Color(0xFFFAFAFA),
                                prefixIcon: Icon(
                                  Icons.phone_android,
                                  color: Color(0xFF0CC873),
                                ),
                                suffixIcon: textController.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () => setState(
                                          () => textController.clear(),
                                        ),
                                        child: Icon(
                                          Icons.clear,
                                          color: Color(0xFF757575),
                                          size: 22,
                                        ),
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Quicksand',
                                color: Color(0xFF696871),
                                fontSize: 32,
                              ),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'Field is required';
                                }

                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (!formKey.currentState.validate()) {
                              return;
                            }
                            if (textController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Enter SMS verification code.'),
                                ),
                              );
                              return;
                            }
                            final phoneVerifiedUser = await verifySmsCode(
                              context: context,
                              smsCode: textController.text,
                            );
                            if (phoneVerifiedUser == null) {
                              return;
                            }
                            await Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    NavBarPage(initialPage: 'Account'),
                              ),
                              (r) => false,
                            );
                          },
                          text: 'Next',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 60,
                            color: FlutterFlowTheme.primaryColor,
                            textStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Quicksand',
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 12,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
