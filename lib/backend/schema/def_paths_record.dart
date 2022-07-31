import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'def_paths_record.g.dart';

abstract class DefPathsRecord
    implements Built<DefPathsRecord, DefPathsRecordBuilder> {
  static Serializer<DefPathsRecord> get serializer =>
      _$defPathsRecordSerializer;

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

  static void _initializeBuilder(DefPathsRecordBuilder builder) => builder
    ..name = ''
    ..floor = ''
    ..source = ''
    ..destination = ''
    ..orderSeq = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('def_paths');

  static Stream<DefPathsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DefPathsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DefPathsRecord._();
  factory DefPathsRecord([void Function(DefPathsRecordBuilder) updates]) =
      _$DefPathsRecord;

  static DefPathsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDefPathsRecordData({
  DocumentReference appRef,
  String name,
  String floor,
  String source,
  String destination,
  int orderSeq,
}) =>
    serializers.toFirestore(
        DefPathsRecord.serializer,
        DefPathsRecord((d) => d
          ..appRef = appRef
          ..name = name
          ..floor = floor
          ..source = source
          ..destination = destination
          ..orderSeq = orderSeq));
