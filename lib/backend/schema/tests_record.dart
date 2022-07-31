import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tests_record.g.dart';

abstract class TestsRecord implements Built<TestsRecord, TestsRecordBuilder> {
  static Serializer<TestsRecord> get serializer => _$testsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'app_ref')
  DocumentReference get appRef;

  @nullable
  @BuiltValueField(wireName: 'Name')
  String get name;

  @nullable
  @BuiltValueField(wireName: 'Floor')
  String get floor;

  @nullable
  @BuiltValueField(wireName: 'Source')
  String get source;

  @nullable
  @BuiltValueField(wireName: 'Destination')
  String get destination;

  @nullable
  @BuiltValueField(wireName: 'order_seq')
  int get orderSeq;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TestsRecordBuilder builder) => builder
    ..name = ''
    ..floor = ''
    ..source = ''
    ..destination = ''
    ..orderSeq = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tests');

  static Stream<TestsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TestsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TestsRecord._();
  factory TestsRecord([void Function(TestsRecordBuilder) updates]) =
      _$TestsRecord;

  static TestsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTestsRecordData({
  DocumentReference appRef,
  String name,
  String floor,
  String source,
  String destination,
  int orderSeq,
}) =>
    serializers.toFirestore(
        TestsRecord.serializer,
        TestsRecord((t) => t
          ..appRef = appRef
          ..name = name
          ..floor = floor
          ..source = source
          ..destination = destination
          ..orderSeq = orderSeq));
