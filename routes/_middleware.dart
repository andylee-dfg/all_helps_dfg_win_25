import 'dart:async';
import 'package:dart_frog/dart_frog.dart';

import 'package:all_helps_dfg_win_25/services/firebase_service.dart';
import 'package:all_helps_dfg_win_25/services/authenticate_request_middleware.dart';

/// A handler class that manages middleware chains in the application.
/// 
/// This class provides functionality to chain multiple middleware together
/// in a composable way.
class MiddlewareHandler {
  /// The underlying middleware handler instance
  final MiddlewareHandler handler;

  /// Creates a new [MiddlewareHandler] with the given base handler
  MiddlewareHandler(this.handler);

  /// Adds a new middleware to the chain
  /// 
  /// Returns a new [MiddlewareHandler] with the added middleware
  /// 
  /// [middleware] - The middleware function to add to the chain
  MiddlewareHandler use(Middleware middleware) {
    return MiddlewareHandler(handler.use(middleware));
  }
}

/// Global Firebase service instance used across the application
final firebaseService = FirebaseService();

/// Main middleware configuration function for the application
///
/// This function sets up the core middleware chain including:
/// - Firebase service initialization and injection
/// - Request authentication
///
/// [handler] - The base middleware handler to build upon
/// 
/// Returns a [Middleware] function that can be used by the Dart Frog framework
Middleware middleware(MiddlewareHandler handler) {
  return (handler) {
    return handler.use(
      // Inject initialized Firebase service into the request context
      provider<Future<FirebaseService>>(
        (context) async {
          await firebaseService.init();
          return firebaseService;
        },
      ),
    // Add authentication middleware to verify requests
    ).use((handler) => handler.use(authenticateRequest()));
  };
}
