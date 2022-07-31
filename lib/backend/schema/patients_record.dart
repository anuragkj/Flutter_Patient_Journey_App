import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'patients_record.g.dart';

abstract class PatientsRecord
    implements Built<PatientsRecord, PatientsRecordBuilder> {
  static Serializer<PatientsRecord> get serializer =>
      _$patientsRecordSerializer;

  @nullable
  String get name;

  @nullable
  String get passport;

  @nullable
  @BuiltValueField(wireName: 'is_main_user')
  bool get isMainUser;

  @nullable
  DocumentReference get ref;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PatientsRecordBuilder builder) => builder
    ..name = ''
    ..passport = ''
    ..isMainUser = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('patients');

  static Stream<PatientsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PatientsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PatientsRecord._();
  factory PatientsRecord([void Function(PatientsRecordBuilder) updates]) =
      _$PatientsRecord;

  static PatientsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPatientsRecordData({
  String name,
  String passport,
  bool isMainUser,
  DocumentReference ref,
}) =>
    serializers.toFirestore(
        PatientsRecord.serializer,
        PatientsRecord((p) => p
          ..name = name
          ..passport = passport
          ..isMainUser = isMainUser
          ..ref = ref));
