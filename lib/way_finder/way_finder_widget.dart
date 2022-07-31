import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class WayFinderWidget extends StatefulWidget {
  const WayFinderWidget({
    Key key,
    this.hospitalRef,
    this.floor,
    this.source,
    this.dest,
  }) : super(key: key);

  final DocumentReference hospitalRef;
  final String floor;
  final String source;
  final String dest;

  @override
  _WayFinderWidgetState createState() => _WayFinderWidgetState();
}

class _WayFinderWidgetState extends State<WayFinderWidget> {
  String dropDownValue1;
  String dropDownValue2;
  String dropDownValue3;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 54,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 24,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Path Finder',
          style: FlutterFlowTheme.of(context).title1,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: StreamBuilder<HospitalsRecord>(
          stream: HospitalsRecord.getDocument(widget.hospitalRef),
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
            final columnHospitalsRecord = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Text(
                            'Floor',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: FlutterFlowDropDown(
                            initialOption: dropDownValue1 ??= widget.floor,
                            options: columnHospitalsRecord.floorsMapping
                                .toList()
                                .toList(),
                            onChanged: (val) =>
                                setState(() => dropDownValue1 = val),
                            width: 165,
                            height: 50,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.black,
                                    ),
                            hintText: 'Floor',
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                              size: 15,
                            ),
                            fillColor: Colors.white,
                            elevation: 2,
                            borderColor: FlutterFlowTheme.of(context).gray600,
                            borderWidth: 0,
                            borderRadius: 5,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                            hidesUnderline: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                            child: Text(
                              'Source',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            child: Text(
                              'Destination',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                            child: FlutterFlowDropDown(
                              initialOption: dropDownValue2 ??= widget.source,
                              options: functions
                                  .populateSubDrops(
                                      columnHospitalsRecord.locationMapping
                                          .toList(),
                                      dropDownValue1)
                                  .toList(),
                              onChanged: (val) =>
                                  setState(() => dropDownValue2 = val),
                              width: 150,
                              height: 50,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.black,
                                  ),
                              hintText: 'Source',
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: FlutterFlowTheme.of(context).tertiary400,
                                size: 15,
                              ),
                              fillColor: Colors.white,
                              elevation: 2,
                              borderColor: FlutterFlowTheme.of(context).gray600,
                              borderWidth: 0,
                              borderRadius: 5,
                              margin:
                                  EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                              hidesUnderline: true,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            child: FlutterFlowDropDown(
                              initialOption: dropDownValue3 ??= widget.dest,
                              options: functions
                                  .populateSubDrops(
                                      columnHospitalsRecord.locationMapping
                                          .toList(),
                                      dropDownValue1)
                                  .toList(),
                              onChanged: (val) =>
                                  setState(() => dropDownValue3 = val),
                              width: 150,
                              height: 50,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.black,
                                  ),
                              hintText: 'Destination',
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: FlutterFlowTheme.of(context).tertiary400,
                                size: 15,
                              ),
                              fillColor: Colors.white,
                              elevation: 2,
                              borderColor: FlutterFlowTheme.of(context).gray600,
                              borderWidth: 0,
                              borderRadius: 5,
                              margin:
                                  EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                              hidesUnderline: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                    child: Text(
                      'Directions',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                    child: StreamBuilder<List<HospitalPathsRecord>>(
                      stream: queryHospitalPathsRecord(
                        queryBuilder: (hospitalPathsRecord) =>
                            hospitalPathsRecord
                                .where('hospRef', isEqualTo: widget.hospitalRef)
                                .where('path_name',
                                    isEqualTo: '${valueOrDefault<String>(
                                      functions
                                          .trimmingOptions2(dropDownValue1),
                                      '1',
                                    )}${valueOrDefault<String>(
                                      functions
                                          .trimmingOptions1(dropDownValue2),
                                      '1',
                                    )}${valueOrDefault<String>(
                                      functions
                                          .trimmingOptions1(dropDownValue3),
                                      '1',
                                    )}'),
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
                        List<HospitalPathsRecord>
                            containerHospitalPathsRecordList = snapshot.data;
                        // Return an empty Container when the document does not exist.
                        if (snapshot.data.isEmpty) {
                          return Container();
                        }
                        final containerHospitalPathsRecord =
                            containerHospitalPathsRecordList.isNotEmpty
                                ? containerHospitalPathsRecordList.first
                                : null;
                        return Container(
                          width: double.infinity,
                          height: 125,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                            child: Builder(
                              builder: (context) {
                                final directions = containerHospitalPathsRecord
                                        .directions
                                        .toList()
                                        ?.toList() ??
                                    [];
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: directions.length,
                                  itemBuilder: (context, directionsIndex) {
                                    final directionsItem =
                                        directions[directionsIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          3, 3, 3, 3),
                                      child: Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: Color(0xFFF5F5F5),
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 0, 5, 0),
                                            child: Text(
                                              directionsItem,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1,
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
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 10, 0, 0),
                    child: Text(
                      'Way',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                  ),
                  StreamBuilder<List<ImagePathsRecord>>(
                    stream: queryImagePathsRecord(
                      queryBuilder: (imagePathsRecord) => imagePathsRecord
                          .where('hospRef', isEqualTo: widget.hospitalRef)
                          .where('image_name',
                              isEqualTo: '${valueOrDefault<String>(
                                functions.trimmingOptions2(dropDownValue1),
                                '1',
                              )}${valueOrDefault<String>(
                                functions.trimmingOptions1(dropDownValue2),
                                '1',
                              )}${valueOrDefault<String>(
                                functions.trimmingOptions1(dropDownValue3),
                                '1',
                              )}'),
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
                      List<ImagePathsRecord> rowImagePathsRecordList =
                          snapshot.data;
                      // Return an empty Container when the document does not exist.
                      if (snapshot.data.isEmpty) {
                        return Container();
                      }
                      final rowImagePathsRecord =
                          rowImagePathsRecordList.isNotEmpty
                              ? rowImagePathsRecordList.first
                              : null;
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  rowImagePathsRecord.url,
                                  width: 200,
                                  height: 500,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
