import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'valet_address_record.g.dart';

abstract class ValetAddressRecord
    implements Built<ValetAddressRecord, ValetAddressRecordBuilder> {
  static Serializer<ValetAddressRecord> get serializer =>
      _$valetAddressRecordSerializer;

  @nullable
  DocumentReference get ref;

  @nullable
  LatLng get location;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ValetAddressRecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('valet_address');

  static Stream<ValetAddressRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ValetAddressRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  ValetAddressRecord._();
  factory ValetAddressRecord(
          [void Function(ValetAddressRecordBuilder) updates]) =
      _$ValetAddressRecord;

  static ValetAddressRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createValetAddressRecordData({
  DocumentReference ref,
  LatLng location,
}) =>
    serializers.toFirestore(
        ValetAddressRecord.serializer,
        ValetAddressRecord((v) => v
          ..ref = ref
          ..location = location));
