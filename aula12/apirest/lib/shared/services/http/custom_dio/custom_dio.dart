import 'package:dio/native_imp.dart';

import 'interceptors/log_interceptor.dart';

class CustomDio extends DioForNative {
  CustomDio() {
    options.baseUrl = const String.fromEnvironment("BASE_URL");
    interceptors.add(LogInterceptor());
  }
}
