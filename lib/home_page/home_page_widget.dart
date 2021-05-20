import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flex_bot/flex_bot_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../list_messages/list_messages_widget.dart';
import '../list_transactions/list_transactions_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({
    Key key,
    this.json,
  }) : super(key: key);

  final dynamic json;

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF16CB79),
        iconTheme: IconThemeData(color: Colors.white),
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Align(
          alignment: Alignment(0, -0.15),
          child: DefaultTabController(
            length: 3,
            initialIndex: 0,
            child: Column(
              children: [
                TabBar(
                  labelColor: FlutterFlowTheme.primaryColor,
                  indicatorColor: FlutterFlowTheme.secondaryColor,
                  tabs: [
                    StreamBuilder<List<TransactionsRecord>>(
                      stream: queryTransactionsRecord(
                        queryBuilder: (transactionsRecord) => transactionsRecord
                            .where('user', isEqualTo: currentUserReference)
                            .orderBy('date'),
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        List<TransactionsRecord> tabTransactionsRecordList =
                            snapshot.data;
                        // Customize what your widget looks like with no query results.
                        if (snapshot.data.isEmpty) {
                          // return Container();
                          // For now, we'll just include some dummy data.
                          tabTransactionsRecordList =
                              createDummyTransactionsRecord(count: 1);
                        }
                        final tabTransactionsRecord =
                            tabTransactionsRecordList.first;
                        return InkWell(
                          onLongPress: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FlexBotWidget(),
                              ),
                            );
                          },
                          child: Tab(
                            text: 'Example 1',
                          ),
                        );
                      },
                    ),
                    InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListTransactionsWidget(),
                          ),
                        );
                      },
                      child: Tab(
                        text: 'Example 2',
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListMessagesWidget(),
                          ),
                        );
                      },
                      child: Tab(
                        text: 'Example 3',
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment(0, 0),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Color(0xFFF5F5F5),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0, 0),
                            child: ListTile(
                              title: Text(
                                'Lorem ipsum dolor...',
                                style: FlutterFlowTheme.title3.override(
                                  fontFamily: 'Quicksand',
                                ),
                              ),
                              subtitle: Text(
                                'Lorem ipsum dolor...',
                                style: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF303030),
                                size: 20,
                              ),
                              tileColor: Color(0xFFF5F5F5),
                              dense: false,
                            ),
                          )
                        ],
                      ),
                      Stack(
                        children: [
                          Text(
                            'Tab View 2',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 32,
                            ),
                          ),
                          GridView(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1,
                            ),
                            scrollDirection: Axis.vertical,
                            children: [
                              Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Color(0xFFF5F5F5),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [],
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                ),
                              ),
                              Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Color(0xFFF5F5F5),
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    StreamBuilder<List<CirclesRecord>>(
                                      stream: queryCirclesRecord(
                                        queryBuilder: (circlesRecord) =>
                                            circlesRecord.where('users',
                                                arrayContains:
                                                    currentUserReference),
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }
                                        List<CirclesRecord>
                                            imageCirclesRecordList =
                                            snapshot.data;
                                        // Customize what your widget looks like with no query results.
                                        if (snapshot.data.isEmpty) {
                                          // return Container();
                                          // For now, we'll just include some dummy data.
                                          imageCirclesRecordList =
                                              createDummyCirclesRecord(
                                                  count: 1);
                                        }
                                        final imageCirclesRecord =
                                            imageCirclesRecordList.first;
                                        return InkWell(
                                          onDoubleTap: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ListMessagesWidget(),
                                              ),
                                            );
                                          },
                                          child: Image.asset(
                                            'assets/images/Flex Together LOGO (1024).png',
                                            width: double.infinity,
                                            height: 120,
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 15, 15, 25),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Card Title',
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  getCurrentTimestamp
                                                      .toString(),
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    color: FlutterFlowTheme
                                                        .secondaryColor,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 8, 0, 0),
                                            child: Text(
                                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum gravida mattis lorem, et posuere tortor rutrum vitae. Vivamus lacinia fringilla libero, at maximus quam imperdiet sed. Pellentesque egestas eget ex a consectetur.',
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Text(
                        'Tab View 3',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          fontSize: 32,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
