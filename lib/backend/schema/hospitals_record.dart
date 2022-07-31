import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'hospitals_record.g.dart';

abstract class HospitalsRecord
    implements Built<HospitalsRecord, HospitalsRecordBuilder> {
  static Serializer<HospitalsRecord> get serializer =>
      _$hospitalsRecordSerializer;

  @nullable
  String get name;

  @nullable
  @BuiltValueField(wireName: 'contact_number')
  String get contactNumber;

  @nullable
  @BuiltValueField(wireName: 'parking_location')
  LatLng get parkingLocation;

  @nullable
  @BuiltValueField(wireName: 'valet_location')
  LatLng get valetLocation;

  @nullable
  @BuiltValueField(wireName: 'location_mapping')
  BuiltList<String> get locationMapping;

  @nullable
  @BuiltValueField(wireName: 'floors_mapping')
  BuiltList<String> get floorsMapping;

  @nullable
  @BuiltValueField(wireName: 'gmap_parking')
  String get gmapParking;

  @nullable
  @BuiltValueField(wireName: 'gmap_valet')
  String get gmapValet;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(HospitalsRecordBuilder builder) => builder
    ..name = ''
    ..contactNumber = ''
    ..locationMapping = ListBuilder()
    ..floorsMapping = ListBuilder()
    ..gmapParking = ''
    ..gmapValet = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('hospitals');

  static Stream<HospitalsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<HospitalsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  HospitalsRecord._();
  factory HospitalsRecord([void Function(HospitalsRecordBuilder) updates]) =
      _$HospitalsRecord;

  static HospitalsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createHospitalsRecordData({
  String name,
  String contactNumber,
  LatLng parkingLocation,
  LatLng valetLocation,
  String gmapParking,
  String gmapValet,
}) =>
    serializers.toFirestore(
        HospitalsRecord.serializer,
        HospitalsRecord((h) => h
          ..name = name
          ..contactNumber = contactNumber
          ..parkingLocation = parkingLocation
          ..valetLocation = valetLocation
          ..locationMapping = null
          ..floorsMapping = null
          ..gmapParking = gmapParking
          ..gmapValet = gmapValet));
