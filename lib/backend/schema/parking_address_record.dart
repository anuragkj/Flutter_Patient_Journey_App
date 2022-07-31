import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'parking_address_record.g.dart';

abstract class ParkingAddressRecord
    implements Built<ParkingAddressRecord, ParkingAddressRecordBuilder> {
  static Serializer<ParkingAddressRecord> get serializer =>
      _$parkingAddressRecordSerializer;

  @nullable
  DocumentReference get ref;

  @nullable
  LatLng get location;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ParkingAddressRecordBuilder builder) =>
      builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('parking_address');

  static Stream<ParkingAddressRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ParkingAddressRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  ParkingAddressRecord._();
  factory ParkingAddressRecord(
          [void Function(ParkingAddressRecordBuilder) updates]) =
      _$ParkingAddressRecord;

  static ParkingAddressRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createParkingAddressRecordData({
  DocumentReference ref,
  LatLng location,
}) =>
    serializers.toFirestore(
        ParkingAddressRecord.serializer,
        ParkingAddressRecord((p) => p
          ..ref = ref
          ..location = location));
