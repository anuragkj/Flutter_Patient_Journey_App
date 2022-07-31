import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'image_paths_record.g.dart';

abstract class ImagePathsRecord
    implements Built<ImagePathsRecord, ImagePathsRecordBuilder> {
  static Serializer<ImagePathsRecord> get serializer =>
      _$imagePathsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'image_name')
  String get imageName;

  @nullable
  String get url;

  @nullable
  DocumentReference get hospRef;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ImagePathsRecordBuilder builder) => builder
    ..imageName = ''
    ..url = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('image_paths');

  static Stream<ImagePathsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ImagePathsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ImagePathsRecord._();
  factory ImagePathsRecord([void Function(ImagePathsRecordBuilder) updates]) =
      _$ImagePathsRecord;

  static ImagePathsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createImagePathsRecordData({
  String imageName,
  String url,
  DocumentReference hospRef,
}) =>
    serializers.toFirestore(
        ImagePathsRecord.serializer,
        ImagePathsRecord((i) => i
          ..imageName = imageName
          ..url = url
          ..hospRef = hospRef));
