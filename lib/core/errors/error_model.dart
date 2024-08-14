
class ErrorModel {
  final int status;
  final String errMessage;

  ErrorModel({required this.status, required this.errMessage});

  factory ErrorModel.fromJson(Map jsonData){
    return ErrorModel(status: jsonData['status'], errMessage: jsonData['errMessage']);
  }
}