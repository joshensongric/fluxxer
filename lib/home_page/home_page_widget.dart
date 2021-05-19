import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flex_bot/flex_bot_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../list_messages/list_messages_widget.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

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
                            builder: (context) =>
                                NavBarPage(initialPage: 'listTransactions'),
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
                      Text(
                        'Tab View 1',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          fontSize: 32,
                        ),
                      ),
                      Text(
                        'Tab View 2',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          fontSize: 32,
                        ),
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
