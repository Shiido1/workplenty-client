import 'package:client/core/network/app_config.dart';
import 'package:client/core/network/network_service.dart';
import 'package:logger/logger.dart';

final Logger logger = Logger();
final NetworkService apiBaseHelper =
    NetworkService(baseUrl: AppConfig.coreBaseUrl);
