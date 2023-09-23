import '/backend/schema/structs/index.dart';

class SyncUsersToAlgoliaCloudFunctionCallResponse {
  SyncUsersToAlgoliaCloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
}
