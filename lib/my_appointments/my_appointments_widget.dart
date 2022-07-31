import '../appointment_way_details/appointment_way_details_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyAppointmentsWidget extends StatefulWidget {
  const MyAppointmentsWidget({Key key}) : super(key: key);

  @override
  _MyAppointmentsWidgetState createState() => _MyAppointmentsWidgetState();
}

class _MyAppointmentsWidgetState extends State<MyAppointmentsWidget> {
  PageController pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Appointments',
          style: FlutterFlowTheme.of(context).title1,
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
            child: Image.asset(
              'assets/images/BCT-Logo.png',
              width: 120,
              height: 40,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 1, 0),
              child: Container(
                width: double.infinity,
                height: 450,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                      child: PageView(
                        controller: pageViewController ??=
                            PageController(initialPage: 0),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                'assets/images/1.webp',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-0.82, 0.87),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await launchURL(
                                              'https://www.asterclinic.ae/');
                                        },
                                        text: 'Know More..',
                                        options: FFButtonOptions(
                                          width: 130,
                                          height: 40,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Colors.white,
                                                  ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Image.asset(
                            'assets/images/a29hc_2.jpg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/images/3.webp',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 1),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: SmoothPageIndicator(
                          controller: pageViewController ??=
                              PageController(initialPage: 0),
                          count: 3,
                          axisDirection: Axis.horizontal,
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
                            dotColor: Color(0xFF9E9E9E),
                            activeDotColor: Color(0xFF3F51B5),
                            paintStyle: PaintingStyle.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<List<AppointmentsRecord>>(
                stream: queryAppointmentsRecord(
                  queryBuilder: (appointmentsRecord) => appointmentsRecord
                      .where('date_time',
                          isGreaterThanOrEqualTo: getCurrentTimestamp)
                      .where('user_ref', isEqualTo: currentUserReference)
                      .orderBy('date_time'),
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
                  List<AppointmentsRecord> listViewAppointmentsRecordList =
                      snapshot.data;
                  if (listViewAppointmentsRecordList.isEmpty) {
                    return Center(
                      child: Image.asset(
                        'assets/images/noAppointments.png',
                        width: MediaQuery.of(context).size.width * 0.8,
                      ),
                    );
                  }
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewAppointmentsRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewAppointmentsRecord =
                          listViewAppointmentsRecordList[listViewIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                        child: InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AppointmentWayDetailsWidget(
                                  appointmentDetails:
                                      listViewAppointmentsRecord.reference,
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
                              height: 200,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 12, 12, 12),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4, 0, 0, 0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            listViewAppointmentsRecord
                                                .patientName,
                                            'No Upcoming Appointment!',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .title3,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 0, 0, 0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                listViewAppointmentsRecord.type,
                                                'No Upcoming Appointment!',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title3,
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.chevron_right_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .grayLight,
                                          size: 24,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            elevation: 0,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 4, 8, 4),
                                                  child: Text(
                                                    dateTimeFormat(
                                                        'MMMMEEEEd',
                                                        listViewAppointmentsRecord
                                                            .dateTime),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                                Text(
                                                  dateTimeFormat(
                                                      'jm',
                                                      listViewAppointmentsRecord
                                                          .dateTime),
                                                  style: FlutterFlowTheme.of(
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
                                          listViewAppointmentsRecord.location),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 40,
                                              height: 40,
                                              child: SpinKitRing(
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                              stream: queryValetAddressRecord(
                                                queryBuilder:
                                                    (valetAddressRecord) =>
                                                        valetAddressRecord.where(
                                                            'ref',
                                                            isEqualTo:
                                                                rowHospitalsRecord
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
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                if (snapshot.data.isEmpty) {
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
                                                                  0, 5, 0, 0),
                                                      child: StreamBuilder<
                                                          List<
                                                              ParkingAddressRecord>>(
                                                        stream:
                                                            queryParkingAddressRecord(
                                                          queryBuilder: (parkingAddressRecord) =>
                                                              parkingAddressRecord.where(
                                                                  'ref',
                                                                  isEqualTo:
                                                                      rowHospitalsRecord
                                                                          .reference),
                                                          singleRecord: true,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                          List<ParkingAddressRecord>
                                                              rowParkingAddressRecordList =
                                                              snapshot.data;
                                                          // Return an empty Container when the document does not exist.
                                                          if (snapshot
                                                              .data.isEmpty) {
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
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                child: Text(
                                                                  'at',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
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
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            7),
                                                                child:
                                                                    FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      30,
                                                                  buttonSize:
                                                                      30,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .location_on,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                    size: 23,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    if ((listViewAppointmentsRecord
                                                                            .valet) ==
                                                                        true) {
                                                                      await launchURL(
                                                                          rowHospitalsRecord
                                                                              .gmapValet);
                                                                    } else {
                                                                      await launchURL(
                                                                          rowHospitalsRecord
                                                                              .gmapParking);
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 5),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 0, 8, 0),
                                            child: Text(
                                              'With',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4, 0, 0, 0),
                                              child: Text(
                                                listViewAppointmentsRecord
                                                    .doctor,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
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
      ),
    );
  }
}
