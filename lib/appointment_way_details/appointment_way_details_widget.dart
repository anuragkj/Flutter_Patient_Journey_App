import '../appointment_details/appointment_details_widget.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AppointmentWayDetailsWidget extends StatefulWidget {
  const AppointmentWayDetailsWidget({
    Key key,
    this.appointmentDetails,
  }) : super(key: key);

  final DocumentReference appointmentDetails;

  @override
  _AppointmentWayDetailsWidgetState createState() =>
      _AppointmentWayDetailsWidgetState();
}

class _AppointmentWayDetailsWidgetState
    extends State<AppointmentWayDetailsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
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
        final appointmentWayDetailsAppointmentsRecord = snapshot.data;
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
              'Directions',
              style: FlutterFlowTheme.of(context).title1,
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: StreamBuilder<HospitalsRecord>(
            stream: HospitalsRecord.getDocument(
                appointmentWayDetailsAppointmentsRecord.location),
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
                      padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                              child: Text(
                                'Way to hospital',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context).title1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    StreamBuilder<List<ParkingAddressRecord>>(
                      stream: queryParkingAddressRecord(
                        queryBuilder: (parkingAddressRecord) =>
                            parkingAddressRecord.where('ref',
                                isEqualTo:
                                    columnMainContentHospitalsRecord.reference),
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
                        List<ParkingAddressRecord> rowParkingAddressRecordList =
                            snapshot.data;
                        // Return an empty Container when the document does not exist.
                        if (snapshot.data.isEmpty) {
                          return Container();
                        }
                        final rowParkingAddressRecord =
                            rowParkingAddressRecordList.isNotEmpty
                                ? rowParkingAddressRecordList.first
                                : null;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
                              child: StreamBuilder<List<ValetAddressRecord>>(
                                stream: queryValetAddressRecord(
                                  queryBuilder: (valetAddressRecord) =>
                                      valetAddressRecord.where('ref',
                                          isEqualTo:
                                              columnMainContentHospitalsRecord
                                                  .reference),
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 40,
                                        ),
                                      ),
                                    );
                                  }
                                  List<ValetAddressRecord>
                                      rowValetAddressRecordList = snapshot.data;
                                  // Return an empty Container when the document does not exist.
                                  if (snapshot.data.isEmpty) {
                                    return Container();
                                  }
                                  final rowValetAddressRecord =
                                      rowValetAddressRecordList.isNotEmpty
                                          ? rowValetAddressRecordList.first
                                          : null;
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 8, 0),
                                        child: Text(
                                          'at',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                fontSize: 18,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        columnMainContentHospitalsRecord.name,
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
                    StreamBuilder<List<ParkingAddressRecord>>(
                      stream: queryParkingAddressRecord(
                        queryBuilder: (parkingAddressRecord) =>
                            parkingAddressRecord.where('ref',
                                isEqualTo:
                                    columnMainContentHospitalsRecord.reference),
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
                        List<ParkingAddressRecord> rowParkingAddressRecordList =
                            snapshot.data;
                        // Return an empty Container when the document does not exist.
                        if (snapshot.data.isEmpty) {
                          return Container();
                        }
                        final rowParkingAddressRecord =
                            rowParkingAddressRecordList.isNotEmpty
                                ? rowParkingAddressRecordList.first
                                : null;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
                              child: StreamBuilder<List<ValetAddressRecord>>(
                                stream: queryValetAddressRecord(
                                  queryBuilder: (valetAddressRecord) =>
                                      valetAddressRecord.where('ref',
                                          isEqualTo:
                                              columnMainContentHospitalsRecord
                                                  .reference),
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 40,
                                        ),
                                      ),
                                    );
                                  }
                                  List<ValetAddressRecord>
                                      rowValetAddressRecordList = snapshot.data;
                                  // Return an empty Container when the document does not exist.
                                  if (snapshot.data.isEmpty) {
                                    return Container();
                                  }
                                  final rowValetAddressRecord =
                                      rowValetAddressRecordList.isNotEmpty
                                          ? rowValetAddressRecordList.first
                                          : null;
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 8, 0),
                                        child: Text(
                                          'Booking Time',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                fontSize: 18,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        dateTimeFormat(
                                            'MMMEd',
                                            appointmentWayDetailsAppointmentsRecord
                                                .dateTime),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Text(
                              dateTimeFormat(
                                  'jm',
                                  appointmentWayDetailsAppointmentsRecord
                                      .dateTime),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ],
                        );
                      },
                    ),
                    StreamBuilder<List<ParkingAddressRecord>>(
                      stream: queryParkingAddressRecord(
                        queryBuilder: (parkingAddressRecord) =>
                            parkingAddressRecord.where('ref',
                                isEqualTo:
                                    columnMainContentHospitalsRecord.reference),
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
                        List<ParkingAddressRecord> rowParkingAddressRecordList =
                            snapshot.data;
                        // Return an empty Container when the document does not exist.
                        if (snapshot.data.isEmpty) {
                          return Container();
                        }
                        final rowParkingAddressRecord =
                            rowParkingAddressRecordList.isNotEmpty
                                ? rowParkingAddressRecordList.first
                                : null;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
                              child: StreamBuilder<List<ValetAddressRecord>>(
                                stream: queryValetAddressRecord(
                                  queryBuilder: (valetAddressRecord) =>
                                      valetAddressRecord.where('ref',
                                          isEqualTo:
                                              columnMainContentHospitalsRecord
                                                  .reference),
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 40,
                                        ),
                                      ),
                                    );
                                  }
                                  List<ValetAddressRecord>
                                      rowValetAddressRecordList = snapshot.data;
                                  // Return an empty Container when the document does not exist.
                                  if (snapshot.data.isEmpty) {
                                    return Container();
                                  }
                                  final rowValetAddressRecord =
                                      rowValetAddressRecordList.isNotEmpty
                                          ? rowValetAddressRecordList.first
                                          : null;
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 8, 0),
                                        child: Text(
                                          'Open Google Maps',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                fontSize: 18,
                                              ),
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30,
                                        buttonSize: 75,
                                        icon: FaIcon(
                                          FontAwesomeIcons.mapMarked,
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                          size: 30,
                                        ),
                                        onPressed: () async {
                                          if ((appointmentWayDetailsAppointmentsRecord
                                                  .valet) ==
                                              true) {
                                            await launchURL(
                                                columnMainContentHospitalsRecord
                                                    .gmapValet);
                                          } else {
                                            await launchURL(
                                                columnMainContentHospitalsRecord
                                                    .gmapParking);
                                          }
                                        },
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
                    StreamBuilder<List<ParkingAddressRecord>>(
                      stream: queryParkingAddressRecord(
                        queryBuilder: (parkingAddressRecord) =>
                            parkingAddressRecord.where('ref',
                                isEqualTo:
                                    columnMainContentHospitalsRecord.reference),
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
                        List<ParkingAddressRecord> rowParkingAddressRecordList =
                            snapshot.data;
                        // Return an empty Container when the document does not exist.
                        if (snapshot.data.isEmpty) {
                          return Container();
                        }
                        final rowParkingAddressRecord =
                            rowParkingAddressRecordList.isNotEmpty
                                ? rowParkingAddressRecordList.first
                                : null;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
                              child: StreamBuilder<List<ValetAddressRecord>>(
                                stream: queryValetAddressRecord(
                                  queryBuilder: (valetAddressRecord) =>
                                      valetAddressRecord.where('ref',
                                          isEqualTo:
                                              columnMainContentHospitalsRecord
                                                  .reference),
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 40,
                                        ),
                                      ),
                                    );
                                  }
                                  List<ValetAddressRecord>
                                      rowValetAddressRecordList = snapshot.data;
                                  // Return an empty Container when the document does not exist.
                                  if (snapshot.data.isEmpty) {
                                    return Container();
                                  }
                                  final rowValetAddressRecord =
                                      rowValetAddressRecordList.isNotEmpty
                                          ? rowValetAddressRecordList.first
                                          : null;
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FutureBuilder<ApiCallResponse>(
                                        future: GetTimeToTravelCall.call(
                                          source: valueOrDefault<String>(
                                            functions.geoPointToString(
                                                currentUserLocationValue),
                                            '25.0525979,55.205992',
                                          ),
                                          destination: valueOrDefault<String>(
                                            functions.geoPointToString(
                                                rowValetAddressRecord.location),
                                            '25.1904524,55.2685826',
                                          ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 40,
                                                height: 40,
                                                child: SpinKitRing(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 40,
                                                ),
                                              ),
                                            );
                                          }
                                          final rowGetTimeToTravelResponse =
                                              snapshot.data;
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if ((rowGetTimeToTravelResponse
                                                          ?.succeeded ??
                                                      true) ??
                                                  true)
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 0, 8, 0),
                                                      child: Text(
                                                        'Travel Time',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  fontSize: 18,
                                                                ),
                                                      ),
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        functions.secsToHrsMins(
                                                            GetTimeToTravelCall
                                                                .timeToReach(
                                                          (rowGetTimeToTravelResponse
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )),
                                                        'null',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ],
                                                ),
                                            ],
                                          );
                                        },
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                            child: Text(
                              'Valet required',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: ToggleIcon(
                              onPressed: () async {
                                final appointmentsUpdateData = {
                                  'valet':
                                      !appointmentWayDetailsAppointmentsRecord
                                          .valet,
                                };
                                await appointmentWayDetailsAppointmentsRecord
                                    .reference
                                    .update(appointmentsUpdateData);
                              },
                              value:
                                  appointmentWayDetailsAppointmentsRecord.valet,
                              onIcon: Icon(
                                Icons.check_box,
                                color: FlutterFlowTheme.of(context).tertiary400,
                                size: 25,
                              ),
                              offIcon: Icon(
                                Icons.check_box_outline_blank,
                                color: FlutterFlowTheme.of(context).tertiary400,
                                size: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 5),
                      child: StreamBuilder<HospitalsRecord>(
                        stream: HospitalsRecord.getDocument(
                            appointmentWayDetailsAppointmentsRecord.location),
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
                          final buttonHospitalsRecord = snapshot.data;
                          return FFButtonWidget(
                            onPressed: () async {
                              await launchURL(
                                  'tel:${buttonHospitalsRecord.contactNumber}');
                            },
                            text: 'Call Hospital',
                            options: FFButtonOptions(
                              width: 200,
                              height: 40,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context).subtitle2,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
                      child: StreamBuilder<HospitalsRecord>(
                        stream: HospitalsRecord.getDocument(
                            appointmentWayDetailsAppointmentsRecord.location),
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
                          final buttonHospitalsRecord = snapshot.data;
                          return FFButtonWidget(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AppointmentDetailsWidget(
                                    appointmentDetails:
                                        widget.appointmentDetails,
                                  ),
                                ),
                              );
                            },
                            text: 'Appointment Details',
                            options: FFButtonOptions(
                              width: 200,
                              height: 40,
                              color: FlutterFlowTheme.of(context).tertiary400,
                              textStyle: FlutterFlowTheme.of(context).subtitle2,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
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
