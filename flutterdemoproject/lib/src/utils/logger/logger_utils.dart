
import 'package:logger/logger.dart';

final _logger = Logger();


void logDebug(dynamic message){
  _logger.d(message??"");
}

void logWarning(dynamic message){
  _logger.w(message??"");
}

void logError(dynamic message){
  _logger.e(message);
}