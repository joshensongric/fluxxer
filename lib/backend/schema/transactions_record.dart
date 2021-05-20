import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'transactions_record.g.dart';

abstract class TransactionsRecord
    implements Built<TransactionsRecord, TransactionsRecordBuilder> {
  static Serializer<TransactionsRecord> get serializer =>
      _$transactionsRecordSerializer;

  @nullable
  Timestamp get date;

  @nullable
  String get merchant;

  @nullable
  double get amount;

  @nullable
  DocumentReference get user;

  @nullable
  DocumentReference get category;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TransactionsRecordBuilder builder) => builder
    ..merchant = ''
    ..amount = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transactions');

  static Stream<TransactionsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TransactionsRecord._();
  factory TransactionsRecord(
          [void Function(TransactionsRecordBuilder) updates]) =
      _$TransactionsRecord;
}

Map<String, dynamic> createTransactionsRecordData({
  Timestamp date,
  String merchant,
  double amount,
  DocumentReference user,
  DocumentReference category,
}) =>
    serializers.serializeWith(
        TransactionsRecord.serializer,
        TransactionsRecord((t) => t
          ..date = date
          ..merchant = merchant
          ..amount = amount
          ..user = user
          ..category = category));

TransactionsRecord get dummyTransactionsRecord {
  final builder = TransactionsRecordBuilder()
    ..date = dummyTimestamp
    ..merchant = dummyString
    ..amount = dummyDouble;
  return builder.build();
}

List<TransactionsRecord> createDummyTransactionsRecord({int count}) =>
    List.generate(count, (_) => dummyTransactionsRecord);
