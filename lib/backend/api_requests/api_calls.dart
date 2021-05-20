import 'api_manager.dart';

Future<dynamic> transactionsdbCall({
  String id = '',
  String location = '',
  double amount,
  String userId = '',
}) =>
    ApiManager.instance.makeApiCall(
      callName: 'Transactionsdb',
      apiDomain: 'x331-yo3a-ajp9.e2.xano.io',
      apiEndpoint: 'api:tJClZNFw/outgoing_transactions',
      callType: ApiCallType.GET,
      headers: {
        'content-type': 'application/json',
      },
      params: {
        'id': id,
        'location': location,
        'amount': amount,
        'user_id': userId,
      },
      returnResponse: true,
    );
