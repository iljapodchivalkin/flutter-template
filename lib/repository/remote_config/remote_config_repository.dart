import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/repository/remote_config/base_remote_config_repository.dart';
import 'package:flutter_template/util/locale/localization_overrides.dart';
import 'package:flutter_template/util/logging/flutter_template_logger.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RemoteConfigRepository extends BaseRemoteConfigRepo {
  
  @override
  Future<void> refreshRemoteConfig() async {
    
    try {
      
      await getIt.get<LocalizationOverrides>().refreshOverrideLocalizations();
    } catch (error, trace) {
      FlutterTemplateLogger.logError('Unable to fetch remote config. Cached or default values will be used', error: error, stackTrace: trace);
    }
  }

  @override
  String? getOptionalValue(String key) {
    
    return null;
  }
}
