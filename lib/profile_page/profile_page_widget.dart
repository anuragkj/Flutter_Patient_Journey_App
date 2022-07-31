import '../appointment_way_details/appointment_way_details_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({Key key}) : super(key: key);

  @override
  _ProfilePageWidgetState createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget>
    with TickerProviderStateMixin {
  String dropDownValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
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
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Profile',
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
      body: SafeArea(
        child: AuthUserStreamWidget(
          child: StreamBuilder<List<PatientsRecord>>(
            stream: queryPatientsRecord(
              queryBuilder: (patientsRecord) => patientsRecord.where('name',
                  isEqualTo:
                      valueOrDefault(currentUserDocument?.currentName, '')),
              singleRecord: true,
            ),
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
              List<PatientsRecord> columnPatientsRecordList = snapshot.data;
              // Return an empty Container when the document does not exist.
              if (snapshot.data.isEmpty) {
                return Container();
              }
              final columnPatientsRecord = columnPatientsRecordList.isNotEmpty
                  ? columnPatientsRecordList.first
                  : null;
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                    child: StreamBuilder<List<PatientsRecord>>(
                      stream: queryPatientsRecord(
                        queryBuilder: (patientsRecord) => patientsRecord
                            .where('ref', isEqualTo: currentUserReference)
                            .where('is_main_user', isEqualTo: true),
                        singleRecord: true,
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
                        List<PatientsRecord> rowPatientsRecordList =
                            snapshot.data;
                        // Return an empty Container when the document does not exist.
                        if (snapshot.data.isEmpty) {
                          return Container();
                        }
                        final rowPatientsRecord =
                            rowPatientsRecordList.isNotEmpty
                                ? rowPatientsRecordList.first
                                : null;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.person,
                                color: FlutterFlowTheme.of(context).tertiary400,
                                size: 24,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'User:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      fontSize: 16,
                                    ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: StreamBuilder<List<PatientsRecord>>(
                                  stream: queryPatientsRecord(
                                    queryBuilder: (patientsRecord) =>
                                        patientsRecord.where('ref',
                                            isEqualTo: currentUserReference),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 40,
                                          height: 40,
                                          child: SpinKitRing(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 40,
                                          ),
                                        ),
                                      );
                                    }
                                    List<PatientsRecord>
                                        dropDownPatientsRecordList =
                                        snapshot.data;
                                    return FlutterFlowDropDown(
                                      initialOption: dropDownValue ??=
                                          valueOrDefault(
                                              currentUserDocument?.currentName,
                                              ''),
                                      options: dropDownPatientsRecordList
                                          .map((e) => e.name)
                                          .toList()
                                          .toList(),
                                      onChanged: (val) =>
                                          setState(() => dropDownValue = val),
                                      width: 180,
                                      height: 50,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 12,
                                          ),
                                      hintText: 'Select User',
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary400,
                                        size: 15,
                                      ),
                                      fillColor: Colors.white,
                                      elevation: 2,
                                      borderColor:
                                          FlutterFlowTheme.of(context).gray600,
                                      borderWidth: 0,
                                      borderRadius: 8,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12, 4, 12, 4),
                                      hidesUnderline: true,
                                    );
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 60,
                                  icon: Icon(
                                    Icons.done,
                                    color: FlutterFlowTheme.of(context)
                                        .tertiary400,
                                    size: 30,
                                  ),
                                  onPressed: () async {
                                    final usersUpdateData =
                                        createUsersRecordData(
                                      currentName: dropDownValue,
                                    );
                                    await currentUserReference
                                        .update(usersUpdateData);
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NavBarPage(
                                            initialPage: 'profilePage'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: Text(
                            'Welcome!!',
                            style: FlutterFlowTheme.of(context).title1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: StreamBuilder<List<PatientsRecord>>(
                      stream: queryPatientsRecord(
                        queryBuilder: (patientsRecord) => patientsRecord.where(
                            'name',
                            isEqualTo: valueOrDefault(
                                currentUserDocument?.currentName, '')),
                        singleRecord: true,
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
                        List<PatientsRecord> usernameMessagePatientsRecordList =
                            snapshot.data;
                        // Return an empty Container when the document does not exist.
                        if (snapshot.data.isEmpty) {
                          return Container();
                        }
                        final usernameMessagePatientsRecord =
                            usernameMessagePatientsRecordList.isNotEmpty
                                ? usernameMessagePatientsRecordList.first
                                : null;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                usernameMessagePatientsRecord.name,
                                style: FlutterFlowTheme.of(context)
                                    .title2
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              child: Image.asset(
                                'assets/images/waving-hand-sign_emoji-modifier-fitzpatrick-type-5_1f44b_1f3fe.png',
                                width: 36,
                                height: 36,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: StreamBuilder<List<PatientsRecord>>(
                      stream: queryPatientsRecord(
                        queryBuilder: (patientsRecord) => patientsRecord.where(
                            'name',
                            isEqualTo: valueOrDefault(
                                currentUserDocument?.currentName, '')),
                        singleRecord: true,
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
                        List<PatientsRecord> usernameMessagePatientsRecordList =
                            snapshot.data;
                        // Return an empty Container when the document does not exist.
                        if (snapshot.data.isEmpty) {
                          return Container();
                        }
                        final usernameMessagePatientsRecord =
                            usernameMessagePatientsRecordList.isNotEmpty
                                ? usernameMessagePatientsRecordList.first
                                : null;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                'Passport: ',
                                style: FlutterFlowTheme.of(context)
                                    .title2
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                              child: Text(
                                columnPatientsRecord.passport,
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            'Coming appointments: ',
                            style: FlutterFlowTheme.of(context).title2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: StreamBuilder<List<AppointmentsRecord>>(
                      stream: queryAppointmentsRecord(
                        queryBuilder: (appointmentsRecord) => appointmentsRecord
                            .where('date_time',
                                isGreaterThanOrEqualTo: getCurrentTimestamp)
                            .where('user_ref', isEqualTo: currentUserReference)
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AppointmentWayDetailsWidget(
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(4, 0, 0, 0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      listViewAppointmentsRecord
                                                          .type,
                                                      'No Upcoming Appointment!',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title3,
                                                  ),
                                                ),
                                              ),
                                              Icon(
                                                Icons.chevron_right_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .grayLight,
                                                size: 24,
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 8, 0, 0),
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
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8, 4, 8, 4),
                                                        child: Text(
                                                          dateTimeFormat(
                                                              'MMMEd',
                                                              listViewAppointmentsRecord
                                                                  .dateTime),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ),
                                                      Text(
                                                        dateTimeFormat(
                                                            'jm',
                                                            listViewAppointmentsRecord
                                                                .dateTime),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          StreamBuilder<HospitalsRecord>(
                                            stream: HospitalsRecord.getDocument(
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
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  StreamBuilder<
                                                      List<ValetAddressRecord>>(
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
                                                            child: SpinKitRing(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                                      width: 40,
                                                                      height:
                                                                          40,
                                                                      child:
                                                                          SpinKitRing(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
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
                                                                final rowParkingAddressRecord =
                                                                    rowParkingAddressRecordList
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
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              8,
                                                                              0,
                                                                              8,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        'at',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      rowHospitalsRecord
                                                                          .name,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              7),
                                                                      child:
                                                                          FlutterFlowIconButton(
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderRadius:
                                                                            30,
                                                                        buttonSize:
                                                                            30,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .location_on,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiaryColor,
                                                                          size:
                                                                              23,
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          if ((listViewAppointmentsRecord.valet) ==
                                                                              true) {
                                                                            await launchURL(rowHospitalsRecord.gmapValet);
                                                                          } else {
                                                                            await launchURL(rowHospitalsRecord.gmapParking);
                                                                          }
                                                                        },
                                                                      ),
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 5),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 0, 8, 0),
                                                  child: Text(
                                                    'With',
                                                    style: FlutterFlowTheme.of(
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
              );
            },
          ),
        ),
      ),
    );
  }
}
