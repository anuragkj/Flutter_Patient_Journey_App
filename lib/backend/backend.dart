import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../flutter_flow/flutter_flow_util.dart';

import 'schema/users_record.dart';
import 'schema/hospitals_record.dart';
import 'schema/appointments_record.dart';
import 'schema/patients_record.dart';
import 'schema/valet_address_record.dart';
import 'schema/parking_address_record.dart';
import 'schema/hospital_paths_record.dart';
import 'schema/image_paths_record.dart';
import 'schema/tests_record.dart';
import 'schema/def_paths_record.dart';
import 'schema/serializers.dart';

export 'dart:async' show StreamSubscription;
export 'package:cloud_firestore/cloud_firestore.dart';
export 'schema/index.dart';
export 'schema/serializers.dart';

export 'schema/users_record.dart';
export 'schema/hospitals_record.dart';
export 'schema/appointments_record.dart';
export 'schema/patients_record.dart';
export 'schema/valet_address_record.dart';
export 'schema/parking_address_record.dart';
export 'schema/hospital_paths_record.dart';
export 'schema/image_paths_record.dart';
export 'schema/tests_record.dart';
export 'schema/def_paths_record.dart';

/// Functions to query UsersRecords (as a Stream and as a Future).
Stream<List<UsersRecord>> queryUsersRecord({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UsersRecord.collection,
      UsersRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UsersRecord>> queryUsersRecordOnce({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UsersRecord.collection,
      UsersRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<FFFirestorePage<UsersRecord>> queryUsersRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
    queryCollectionPage(
      UsersRecord.collection,
      UsersRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

/// Functions to query HospitalsRecords (as a Stream and as a Future).
Stream<List<HospitalsRecord>> queryHospitalsRecord({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      HospitalsRecord.collection,
      HospitalsRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<HospitalsRecord>> queryHospitalsRecordOnce({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      HospitalsRecord.collection,
      HospitalsRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<FFFirestorePage<HospitalsRecord>> queryHospitalsRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
    queryCollectionPage(
      HospitalsRecord.collection,
      HospitalsRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

/// Functions to query AppointmentsRecords (as a Stream and as a Future).
Stream<List<AppointmentsRecord>> queryAppointmentsRecord({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      AppointmentsRecord.collection,
      AppointmentsRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<AppointmentsRecord>> queryAppointmentsRecordOnce({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      AppointmentsRecord.collection,
      AppointmentsRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<FFFirestorePage<AppointmentsRecord>> queryAppointmentsRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
    queryCollectionPage(
      AppointmentsRecord.collection,
      AppointmentsRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

/// Functions to query PatientsRecords (as a Stream and as a Future).
Stream<List<PatientsRecord>> queryPatientsRecord({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      PatientsRecord.collection,
      PatientsRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<PatientsRecord>> queryPatientsRecordOnce({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      PatientsRecord.collection,
      PatientsRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<FFFirestorePage<PatientsRecord>> queryPatientsRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
    queryCollectionPage(
      PatientsRecord.collection,
      PatientsRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

/// Functions to query ValetAddressRecords (as a Stream and as a Future).
Stream<List<ValetAddressRecord>> queryValetAddressRecord({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ValetAddressRecord.collection,
      ValetAddressRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ValetAddressRecord>> queryValetAddressRecordOnce({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ValetAddressRecord.collection,
      ValetAddressRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<FFFirestorePage<ValetAddressRecord>> queryValetAddressRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
    queryCollectionPage(
      ValetAddressRecord.collection,
      ValetAddressRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

/// Functions to query ParkingAddressRecords (as a Stream and as a Future).
Stream<List<ParkingAddressRecord>> queryParkingAddressRecord({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ParkingAddressRecord.collection,
      ParkingAddressRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ParkingAddressRecord>> queryParkingAddressRecordOnce({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ParkingAddressRecord.collection,
      ParkingAddressRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<FFFirestorePage<ParkingAddressRecord>> queryParkingAddressRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
    queryCollectionPage(
      ParkingAddressRecord.collection,
      ParkingAddressRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

/// Functions to query HospitalPathsRecords (as a Stream and as a Future).
Stream<List<HospitalPathsRecord>> queryHospitalPathsRecord({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      HospitalPathsRecord.collection,
      HospitalPathsRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<HospitalPathsRecord>> queryHospitalPathsRecordOnce({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      HospitalPathsRecord.collection,
      HospitalPathsRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<FFFirestorePage<HospitalPathsRecord>> queryHospitalPathsRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
    queryCollectionPage(
      HospitalPathsRecord.collection,
      HospitalPathsRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

/// Functions to query ImagePathsRecords (as a Stream and as a Future).
Stream<List<ImagePathsRecord>> queryImagePathsRecord({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ImagePathsRecord.collection,
      ImagePathsRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ImagePathsRecord>> queryImagePathsRecordOnce({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ImagePathsRecord.collection,
      ImagePathsRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<FFFirestorePage<ImagePathsRecord>> queryImagePathsRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
    queryCollectionPage(
      ImagePathsRecord.collection,
      ImagePathsRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

/// Functions to query TestsRecords (as a Stream and as a Future).
Stream<List<TestsRecord>> queryTestsRecord({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      TestsRecord.collection,
      TestsRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<TestsRecord>> queryTestsRecordOnce({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      TestsRecord.collection,
      TestsRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<FFFirestorePage<TestsRecord>> queryTestsRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
    queryCollectionPage(
      TestsRecord.collection,
      TestsRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

/// Functions to query DefPathsRecords (as a Stream and as a Future).
Stream<List<DefPathsRecord>> queryDefPathsRecord({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      DefPathsRecord.collection,
      DefPathsRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<DefPathsRecord>> queryDefPathsRecordOnce({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      DefPathsRecord.collection,
      DefPathsRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<FFFirestorePage<DefPathsRecord>> queryDefPathsRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
    queryCollectionPage(
      DefPathsRecord.collection,
      DefPathsRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

Stream<List<T>> queryCollection<T>(Query collection, Serializer<T> serializer,
    {Query Function(Query) queryBuilder,
    int limit = -1,
    bool singleRecord = false}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.snapshots().handleError((err) {
    print('Error querying $collection: $err');
  }).map((s) => s.docs
      .map(
        (d) => safeGet(
          () => serializers.deserializeWith(serializer, serializedData(d)),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .toList());
}

Future<List<T>> queryCollectionOnce<T>(
    Query collection, Serializer<T> serializer,
    {Query Function(Query) queryBuilder,
    int limit = -1,
    bool singleRecord = false}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.get().then((s) => s.docs
      .map(
        (d) => safeGet(
          () => serializers.deserializeWith(serializer, serializedData(d)),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .toList());
}

class FFFirestorePage<T> {
  final List<T> data;
  final Stream<List<T>> dataStream;
  final QueryDocumentSnapshot nextPageMarker;

  FFFirestorePage(this.data, this.dataStream, this.nextPageMarker);
}

Future<FFFirestorePage<T>> queryCollectionPage<T>(
  Query collection,
  Serializer<T> serializer, {
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) async {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection).limit(pageSize);
  if (nextPageMarker != null) {
    query = query.startAfterDocument(nextPageMarker);
  }
  Stream<QuerySnapshot> docSnapshotStream;
  QuerySnapshot docSnapshot;
  if (isStream) {
    docSnapshotStream = query.snapshots();
    docSnapshot = await docSnapshotStream.first;
  } else {
    docSnapshot = await query.get();
  }
  final getDocs = (QuerySnapshot s) => s.docs
      .map(
        (d) => safeGet(
          () => serializers.deserializeWith(serializer, serializedData(d)),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .toList();
  final data = getDocs(docSnapshot);
  final dataStream = docSnapshotStream?.map(getDocs);
  final nextPageToken = docSnapshot.docs.isEmpty ? null : docSnapshot.docs.last;
  return FFFirestorePage(data, dataStream, nextPageToken);
}

// Creates a Firestore document representing the logged in user if it doesn't yet exist
Future maybeCreateUser(User user) async {
  final userRecord = UsersRecord.collection.doc(user.uid);
  final userExists = await userRecord.get().then((u) => u.exists);
  if (userExists) {
    return;
  }

  final userData = createUsersRecordData(
    email: user.email,
    displayName: user.displayName,
    photoUrl: user.photoURL,
    uid: user.uid,
    phoneNumber: user.phoneNumber,
    createdTime: getCurrentTimestamp,
  );

  await userRecord.set(userData);
}
