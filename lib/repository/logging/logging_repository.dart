import 'dart:io';
import 'package:flutter_template/repository/logging/base_logging_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoggingRepository extends BaseLoggingRepository {
  

  LoggingRepository(
 
    super.secureLogStorage,
  );

  @override
  Future<void> uploadFile(File file, DateTime date) async {
   
  }
}
