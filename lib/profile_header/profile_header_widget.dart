import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../list_events/list_events_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileHeaderWidget extends StatefulWidget {
  ProfileHeaderWidget({Key key}) : super(key: key);

  @override
  _ProfileHeaderWidgetState createState() => _ProfileHeaderWidgetState();
}

class _ProfileHeaderWidgetState extends State<ProfileHeaderWidget> {
  String uploadedFileUrl;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Align(
          alignment: Alignment(0, 0.05),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFF263238),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'FlutterFlow',
                            style: GoogleFonts.getFont(
                              'Quicksand',
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            '@flutterflow',
                            style: GoogleFonts.getFont(
                              'Quicksand',
                              color: Color(0xFF1B5E20),
                            ),
                          )
                        ],
                      ),
                    ),
                    Icon(
                      Icons.keyboard_control,
                      color: Color(0xFF263238),
                      size: 20,
                    )
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      final selectedMedia = await selectMedia();
                      if (selectedMedia != null &&
                          validateFileFormat(
                              selectedMedia.storagePath, context)) {
                        showUploadMessage(context, 'Uploading file...',
                            showLoading: true);
                        final downloadUrl = await uploadData(
                            selectedMedia.storagePath, selectedMedia.bytes);
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        if (downloadUrl != null) {
                          setState(() => uploadedFileUrl = downloadUrl);
                          showUploadMessage(context, 'Success!');
                        } else {
                          showUploadMessage(context, 'Failed to upload media');
                        }
                      }
                    },
                    child: Container(
                      width: 90,
                      height: 90,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        'http://storage.googleapis.com/flutterflow-io-6f20.appspot.com/flutterflow_assets/ff_temp_icon.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '199',
                        style: GoogleFonts.getFont(
                          'Quicksand',
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                        child: Text(
                          'POSTS',
                          style: GoogleFonts.getFont(
                            'Quicksand',
                            color: Color(0xFF90A4AE),
                            fontSize: 11,
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '26',
                        style: GoogleFonts.getFont(
                          'Quicksand',
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                        child: Text(
                          'FOLLOWERS',
                          style: GoogleFonts.getFont(
                            'Quicksand',
                            color: Color(0xFF90A4AE),
                            fontSize: 11,
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '15',
                        style: GoogleFonts.getFont(
                          'Quicksand',
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                        child: Text(
                          'FOLLOWING',
                          style: GoogleFonts.getFont(
                            'Quicksand',
                            color: Color(0xFF90A4AE),
                            fontSize: 11,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.show_chart_rounded,
                          color: Color(0xFFFF5722),
                          size: 18,
                        ),
                        Text(
                          'Rank: 1',
                          style: GoogleFonts.getFont(
                            'Quicksand',
                            color: Color(0xFF455A64),
                            fontSize: 11,
                          ),
                        )
                      ],
                    ),
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Following',
                      options: FFButtonOptions(
                        width: 110,
                        height: 30,
                        color: Color(0xFF88C17D),
                        textStyle: GoogleFonts.getFont(
                          'Roboto',
                          color: Colors.white,
                          fontSize: 13,
                        ),
                        elevation: 2,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: 28,
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'User Map',
                      options: FFButtonOptions(
                        width: 110,
                        height: 30,
                        color: Color(0xFF88C17D),
                        textStyle: GoogleFonts.getFont(
                          'Roboto',
                          color: Colors.white,
                          fontSize: 13,
                        ),
                        elevation: 2,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: 28,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 32, 0, 0),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    border: Border.all(
                      color: Color(0xFFD6D6D6),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListEventsWidget(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.photo_outlined,
                          color: Color(0xFF9E9E9E),
                          size: 28,
                        ),
                      ),
                      Icon(
                        Icons.wine_bar,
                        color: Color(0xFF9E9E9E),
                        size: 28,
                      ),
                      Icon(
                        Icons.bookmark_border,
                        color: Color(0xFF9E9E9E),
                        size: 28,
                      ),
                      Icon(
                        Icons.flag_outlined,
                        color: Color(0xFF9E9E9E),
                        size: 28,
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, 0),
                child: Container(
                  width: 230,
                  height: 44,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment(-0.83, 0),
                        child: Container(
                          width: 22,
                          height: 22,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            'https://i0.wp.com/nanophorm.com/wp-content/uploads/2018/04/google-logo-icon-PNG-Transparent-Background.png?w=1000&ssl=1',
                            fit: BoxFit.contain,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
