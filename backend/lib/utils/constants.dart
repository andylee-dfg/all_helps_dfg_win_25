import 'dart:io';

/// Firebase API key required for authentication and API access
///
/// This constant retrieves the API key from environment variables.
/// The API key must be set in the environment as 'API_KEY'.
///
/// Throws:
///   - [Exception] if API_KEY environment variable is not set
String apiKey = Platform.environment['API_KEY'] ??
    (() {
      throw Exception('API_KEY is not set');
    })();

/// Firebase authentication domain for the application
///
/// This constant retrieves the auth domain from environment variables.
/// The auth domain must be set in the environment as 'AUTH_DOMAIN'.
///
/// Throws:
///   - [Exception] if AUTH_DOMAIN environment variable is not set
String authDomain = Platform.environment['AUTH_DOMAIN'] ??
    (() {
      throw Exception('AUTH_DOMAIN is not set');
    })();

// all_helps_fe_dfg_win_25
