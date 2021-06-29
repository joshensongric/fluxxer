import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'circles_record.g.dart';

abstract class CirclesRecord
    implements Built<CirclesRecord, CirclesRecordBuilder> {
  static Serializer<CirclesRecord> get serializer => _$circlesRecordSerializer;

  @nullable
  String get name;

  @nullable
  BuiltList<DocumentReference> get users;

  @nullable
  BuiltList<DocumentReference> get transactions;

  @nullable
  String get picture;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CirclesRecordBuilder builder) => builder
    ..name = ''
    ..users = ListBuilder()
    ..transactions = ListBuilder()
    ..picture = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('circles');

  static Stream<CirclesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CirclesRecord._();
  factory CirclesRecord([void Function(CirclesRecordBuilder) updates]) =
      _$CirclesRecord;

  static CirclesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createCirclesRecordData({
  String name,
  String picture,
}) =>
    serializers.toFirestore(
        CirclesRecord.serializer,
        CirclesRecord((c) => c
          ..name = name
          ..users = null
          ..transactions = null
          ..picture = picture));
