import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'accounts_record.g.dart';

abstract class AccountsRecord
    implements Built<AccountsRecord, AccountsRecordBuilder> {
  static Serializer<AccountsRecord> get serializer =>
      _$accountsRecordSerializer;

  @nullable
  DocumentReference get user;

  @nullable
  @BuiltValueField(wireName: 'Currency')
  String get currency;

  @nullable
  String get balance;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AccountsRecordBuilder builder) => builder
    ..currency = ''
    ..balance = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('accounts');

  static Stream<AccountsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  AccountsRecord._();
  factory AccountsRecord([void Function(AccountsRecordBuilder) updates]) =
      _$AccountsRecord;

  static AccountsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createAccountsRecordData({
  DocumentReference user,
  String currency,
  String balance,
}) =>
    serializers.toFirestore(
        AccountsRecord.serializer,
        AccountsRecord((a) => a
          ..user = user
          ..currency = currency
          ..balance = balance));
