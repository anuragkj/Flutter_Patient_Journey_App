import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../way_finder/way_finder_widget.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AppointmentDetailsWidget extends StatefulWidget {
  const AppointmentDetailsWidget({
    Key key,
    this.appointmentDetails,
  }) : super(key: key);

  final DocumentReference appointmentDetails;

  @override
  _AppointmentDetailsWidgetState createState() =>
      _AppointmentDetailsWidgetState();
}

class _AppointmentDetailsWidgetState extends State<AppointmentDetailsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AppointmentsRecord>(
      stream: AppointmentsRecord.getDocument(widget.appointmentDetails),
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
        final appointmentDetailsAppointmentsRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.chevron_left_rounded,
                color: FlutterFlowTheme.of(context).grayLight,
                size: 32,
              ),
            ),
            title: Text(
              'Details',
              style: FlutterFlowTheme.of(context).title1,
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: StreamBuilder<HospitalsRecord>(
            stream: HospitalsRecord.getDocument(
                appointmentDetailsAppointmentsRecord.location),
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
              final columnMainContentHospitalsRecord = snapshot.data;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                      child: Container(
                        width: 200,
                        height: 200,
                        child: custom_widgets.QRCode(
                          width: 200,
                          height: 200,
                          qrSize: 200.0,
                          qrData: functions.getDocumentId(
                              appointmentDetailsAppointmentsRecord.reference),
                          qrVersion: 2,
                          qrPadding: 15.0,
                          qrBorderRadius: 10.0,
                          semanticsLabel: 'Appointement',
                          qrBackgroundColor: Color(0xFFE1E1E1),
                          qrForegroundColor: Color(0xFF353535),
                        ),
                      ),
                    ),
                    if ((appointmentDetailsAppointmentsRecord.tokenNum !=
                            null &&
                        appointmentDetailsAppointmentsRecord.tokenNum != ''))
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 100,
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
                                                  'Token Number',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title3,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 0),
                                            child: Text(
                                              appointmentDetailsAppointmentsRecord
                                                  .tokenNum,
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    fontSize: 28,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'Common locations',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                          child: StreamBuilder<List<DefPathsRecord>>(
                            stream: queryDefPathsRecord(
                              queryBuilder: (defPathsRecord) => defPathsRecord
                                  .where('app_ref',
                                      isEqualTo: widget.appointmentDetails)
                                  .orderBy('order_seq'),
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
                              List<DefPathsRecord> listViewDefPathsRecordList =
                                  snapshot.data;
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: listViewDefPathsRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewDefPathsRecord =
                                      listViewDefPathsRecordList[listViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        3, 3, 3, 3),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Color(0xFFF5F5F5),
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 5, 0),
                                                child: Text(
                                                  listViewDefPathsRecord.name,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30,
                                              borderWidth: 1,
                                              buttonSize: 60,
                                              icon: Icon(
                                                Icons.directions,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary400,
                                                size: 30,
                                              ),
                                              onPressed: () async {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        WayFinderWidget(
                                                      hospitalRef:
                                                          columnMainContentHospitalsRecord
                                                              .reference,
                                                      floor:
                                                          listViewDefPathsRecord
                                                              .floor,
                                                      source:
                                                          listViewDefPathsRecord
                                                              .source,
                                                      dest:
                                                          listViewDefPathsRecord
                                                              .destination,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'Type of Appointment',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              appointmentDetailsAppointmentsRecord.patientName,
                              style:
                                  FlutterFlowTheme.of(context).title3.override(
                                        fontFamily: 'Lexend Deca',
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              appointmentDetailsAppointmentsRecord.type,
                              style:
                                  FlutterFlowTheme.of(context).title3.override(
                                        fontFamily: 'Lexend Deca',
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                              child: Text(
                                'When',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                            child: Text(
                              dateTimeFormat(
                                  'MMMMEEEEd',
                                  appointmentDetailsAppointmentsRecord
                                      .dateTime),
                              style:
                                  FlutterFlowTheme.of(context).title1.override(
                                        fontFamily: 'Lexend Deca',
                                        fontSize: 18,
                                      ),
                            ),
                          ),
                          Text(
                            dateTimeFormat('jm',
                                appointmentDetailsAppointmentsRecord.dateTime),
                            style: FlutterFlowTheme.of(context).title1.override(
                                  fontFamily: 'Lexend Deca',
                                  fontSize: 18,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                            child: Text(
                              'With',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    fontSize: 18,
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                              child: Text(
                                appointmentDetailsAppointmentsRecord.doctor,
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 20),
                      child: StreamBuilder<List<TestsRecord>>(
                        stream: queryTestsRecord(
                          queryBuilder: (testsRecord) => testsRecord
                              .where('app_ref',
                                  isEqualTo: widget.appointmentDetails)
                              .orderBy('order_seq'),
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
                          List<TestsRecord> listViewTestsRecordList =
                              snapshot.data;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewTestsRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewTestsRecord =
                                  listViewTestsRecordList[listViewIndex];
                              return Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 0, 0, 0),
                                                child: Text(
                                                  listViewTestsRecord.name,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        fontSize: 18,
                                                      ),
                                                ),
                                              ),
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30,
                                                borderWidth: 1,
                                                buttonSize: 60,
                                                icon: Icon(
                                                  Icons.directions,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary400,
                                                  size: 30,
                                                ),
                                                onPressed: () async {
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          WayFinderWidget(
                                                        hospitalRef:
                                                            columnMainContentHospitalsRecord
                                                                .reference,
                                                        floor:
                                                            listViewTestsRecord
                                                                .floor,
                                                        source:
                                                            listViewTestsRecord
                                                                .source,
                                                        dest:
                                                            listViewTestsRecord
                                                                .destination,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
