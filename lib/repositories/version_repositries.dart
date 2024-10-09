// repositories/version_repository.dart

import 'package:package_info_plus/package_info_plus.dart';
import 'package:ridewave/model/Version.dart';
import 'package:ridewave/services/VersionServices.dart';

class VersionRepository {
  final VersionService _versionService = VersionService();



  // Get the installed version of the app
  Future<String> getInstalledVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  // Check if an update is required
  Future<bool> isUpdateRequired() async {
    final latestVersion= Version.fromJson(await _versionService.versionCheck());

    if(latestVersion.skip){
      return false;
    }

    final installedVersion = await getInstalledVersion();


    return _compareVersions(latestVersion.version,installedVersion);



  }

  // Helper function to compare versions
  bool _compareVersions(String latest, String current) {
    List<int> latestParts = latest.split('.').map((e) => int.parse(e)).toList();
    List<int> currentParts = current.split('.').map((e) => int.parse(e)).toList();

    for (int i = 0; i < latestParts.length; i++) {
      if (i < currentParts.length) {
        if (latestParts[i] > currentParts[i]) return false;
        if (latestParts[i] < currentParts[i]) return true;
      }
    }
    return true;
  }
}
