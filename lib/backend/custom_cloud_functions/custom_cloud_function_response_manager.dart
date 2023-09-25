import '/backend/schema/structs/index.dart';

class AddUserToAlgoliaCloudFunctionCallResponse {
  AddUserToAlgoliaCloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
}
