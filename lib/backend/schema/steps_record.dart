import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'steps_record.g.dart';

abstract class StepsRecord implements Built<StepsRecord, StepsRecordBuilder> {
  static Serializer<StepsRecord> get serializer => _$stepsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'step_name')
  String get stepName;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(StepsRecordBuilder builder) =>
      builder..stepName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('steps');

  static Stream<StepsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  StepsRecord._();
  factory StepsRecord([void Function(StepsRecordBuilder) updates]) =
      _$StepsRecord;

  static StepsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createStepsRecordData({
  String stepName,
}) =>
    serializers.toFirestore(
        StepsRecord.serializer, StepsRecord((s) => s..stepName = stepName));
