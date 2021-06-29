import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'goals_record.g.dart';

abstract class GoalsRecord implements Built<GoalsRecord, GoalsRecordBuilder> {
  static Serializer<GoalsRecord> get serializer => _$goalsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'goal_name')
  String get goalName;

  @nullable
  BuiltList<DocumentReference> get steps;

  @nullable
  DocumentReference get user;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(GoalsRecordBuilder builder) => builder
    ..goalName = ''
    ..steps = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('goals');

  static Stream<GoalsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  GoalsRecord._();
  factory GoalsRecord([void Function(GoalsRecordBuilder) updates]) =
      _$GoalsRecord;

  static GoalsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createGoalsRecordData({
  String goalName,
  DocumentReference user,
}) =>
    serializers.toFirestore(
        GoalsRecord.serializer,
        GoalsRecord((g) => g
          ..goalName = goalName
          ..steps = null
          ..user = user));
