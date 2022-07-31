import '../appointment_details_history/appointment_details_history_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../login_page/login_page_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PastAppointmentsWidget extends StatefulWidget {
  const PastAppointmentsWidget({
    Key key,
    this.userProfile,
  }) : super(key: key);

  final DocumentReference userProfile;

  @override
  _PastAppointmentsWidgetState createState() => _PastAppointmentsWidgetState();
}

class _PastAppointmentsWidgetState extends State<PastAppointmentsWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'listViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(-0.0, 51),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: SpinKitRing(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 40,
              ),
            ),
          );
        }
        final pastAppointmentsUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: false,
            title: Text(
              'History',
              style: FlutterFlowTheme.of(context).title1,
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                child: Image.asset(
                  'assets/images/BCT-Logo.png',
                  width: 120,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ],
            centerTitle: false,
            elevation: 2,
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 30, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: AuthUserStreamWidget(
                              child: Text(
                                valueOrDefault(
                                    currentUserDocument?.currentName, ''),
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context).title3,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 0, 0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Container(
                                      width: 44,
                                      height: 44,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 2,
                                        ),
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .gray600,
                                          borderRadius: 22,
                                          borderWidth: 0,
                                          buttonSize: 46,
                                          icon: Icon(
                                            Icons.login_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            size: 24,
                                          ),
                                          onPressed: () async {
                                            await signOut();
                                            await Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPageWidget(),
                                              ),
                                              (r) => false,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Past Appointments',
                            style: FlutterFlowTheme.of(context).title2,
                          ),
                        ],
                      ),
                    ),
                    AuthUserStreamWidget(
                      child: StreamBuilder<List<AppointmentsRecord>>(
                        stream: queryAppointmentsRecord(
                          queryBuilder: (appointmentsRecord) =>
                              appointmentsRecord
                                  .where('date_time',
                                      isLessThan: getCurrentTimestamp)
                                  .where('user_ref',
                                      isEqualTo: currentUserReference)
                                  .where('patient_name',
                                      isEqualTo: valueOrDefault(
                                          currentUserDocument?.currentName, ''))
                                  .orderBy('date_time', descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: SpinKitRing(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 40,
                                ),
                              ),
                            );
                          }
                          List<AppointmentsRecord>
                              listViewAppointmentsRecordList = snapshot.data;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewAppointmentsRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewAppointmentsRecord =
                                  listViewAppointmentsRecordList[listViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 12),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AppointmentDetailsHistoryWidget(
                                          appointmentDetails:
                                              listViewAppointmentsRecord
                                                  .reference,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 12, 12, 12),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                4, 0, 0, 0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        listViewAppointmentsRecord
                                                            .type,
                                                        'No Upcoming Appointment!',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .title3,
                                                    ),
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.chevron_right_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayLight,
                                                  size: 24,
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Card(
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryColor,
                                                    elevation: 0,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 4, 8, 4),
                                                      child: Text(
                                                        dateTimeFormat(
                                                            'MMMEd',
                                                            listViewAppointmentsRecord
                                                                .dateTime),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            StreamBuilder<HospitalsRecord>(
                                              stream:
                                                  HospitalsRecord.getDocument(
                                                      listViewAppointmentsRecord
                                                          .location),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 40,
                                                      height: 40,
                                                      child: SpinKitRing(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 40,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final rowHospitalsRecord =
                                                    snapshot.data;
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    StreamBuilder<
                                                        List<
                                                            ValetAddressRecord>>(
                                                      stream:
                                                          queryValetAddressRecord(
                                                        queryBuilder: (valetAddressRecord) =>
                                                            valetAddressRecord.where(
                                                                'ref',
                                                                isEqualTo:
                                                                    rowHospitalsRecord
                                                                        .reference),
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 40,
                                                              height: 40,
                                                              child:
                                                                  SpinKitRing(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 40,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<ValetAddressRecord>
                                                            rowValetAddressRecordList =
                                                            snapshot.data;
                                                        // Return an empty Container when the document does not exist.
                                                        if (snapshot
                                                            .data.isEmpty) {
                                                          return Container();
                                                        }
                                                        final rowValetAddressRecord =
                                                            rowValetAddressRecordList
                                                                    .isNotEmpty
                                                                ? rowValetAddressRecordList
                                                                    .first
                                                                : null;
                                                        return Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          5,
                                                                          0,
                                                                          0),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      ParkingAddressRecord>>(
                                                                stream:
                                                                    queryParkingAddressRecord(
                                                                  queryBuilder: (parkingAddressRecord) =>
                                                                      parkingAddressRecord.where(
                                                                          'ref',
                                                                          isEqualTo:
                                                                              rowHospitalsRecord.reference),
                                                                  singleRecord:
                                                                      true,
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            40,
                                                                        height:
                                                                            40,
                                                                        child:
                                                                            SpinKitRing(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          size:
                                                                              40,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<ParkingAddressRecord>
                                                                      rowParkingAddressRecordList =
                                                                      snapshot
                                                                          .data;
                                                                  // Return an empty Container when the document does not exist.
                                                                  if (snapshot
                                                                      .data
                                                                      .isEmpty) {
                                                                    return Container();
                                                                  }
                                                                  final rowParkingAddressRecord = rowParkingAddressRecordList
                                                                          .isNotEmpty
                                                                      ? rowParkingAddressRecordList
                                                                          .first
                                                                      : null;
                                                                  return Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          'at',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyText1,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        rowHospitalsRecord
                                                                            .name,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1,
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 5),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                8, 0, 8, 0),
                                                    child: Text(
                                                      'With',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4, 0, 0, 0),
                                                      child: Text(
                                                        listViewAppointmentsRecord
                                                            .doctor,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).animated(
                              [animationsMap['listViewOnPageLoadAnimation']]);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
