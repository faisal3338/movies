

import 'package:movies/core/network/error_message_model.dart';

class ServerException implements Exception{
  final ErrorMessageModel errorMessageModel;
  
  const ServerException({
    required this.errorMessageModel
    });
}

class localDatabaseException implements Exception{
  final String message;
  
  const localDatabaseException({
    required this.message,
  });
}





