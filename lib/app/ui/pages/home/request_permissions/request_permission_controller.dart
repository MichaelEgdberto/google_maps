import 'dart:async';

import 'package:permission_handler/permission_handler.dart';

class RequestPermissionController {
  final Permission _locationPermission;
  final _streamController = StreamController<PermissionStatus>.broadcast();
  RequestPermissionController(this._locationPermission);

  Stream<PermissionStatus> get onStatusChanged => _streamController.stream;

  Future<PermissionStatus> check() async {
    final status = await _locationPermission.status;
    return status;
  }

  Future<void> request() async {
    final status = await _locationPermission.request();
    print("status $status");
  }

  void _notify(PermissionStatus status) {
    if (!_streamController.isClosed && _streamController.hasListener) {
      print("status $status");
      _notify(status);
    }
  }

  void dispose() {
    _streamController.close();
  }
}
