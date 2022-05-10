import 'package:permission_handler/permission_handler.dart';

class RequestPermissionController {
  final Permission _localPermission;
  RequestPermissionController(this._localPermission);

  request() async {
    final status = await _localPermission.request();
    if (status == PermissionStatus.granted) {}
  }
}
