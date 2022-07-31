import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'hospital_paths_record.g.dart';

abstract class HospitalPathsRecord
    implements Built<HospitalPathsRecord, HospitalPathsRecordBuilder> {
  static Serializer<HospitalPathsRecord> get serializer =>
      _$hospitalPathsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'path_name')
  String get pathName;

  @nullable
  BuiltList<String> get directions;

  @nullable
  DocumentReference get hospRef;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(HospitalPathsRecordBuilder builder) => builder
    ..pathName = ''
    ..directions = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('hospital_paths');

  static Stream<HospitalPathsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<HospitalPathsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  HospitalPathsRecord._();
  factory HospitalPathsRecord(
          [void Function(HospitalPathsRecordBuilder) updates]) =
      _$HospitalPathsRecord;

  static HospitalPathsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createHospitalPathsRecordData({
  String pathName,
  DocumentReference hospRef,
}) =>
    serializers.toFirestore(
        HospitalPathsRecord.serializer,
        HospitalPathsRecord((h) => h
          ..pathName = pathName
          ..directions = null
          ..hospRef = hospRef));
