import 'dart:io';

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Env {
  late EnvMode _mode;
  EnvOptions? _options;

  static final Env _instance = Env._internal();

  Env._internal();

  factory Env(EnvMode mode, [EnvOptions? options]) {
    _instance._mode = mode;
    _instance._options = options;

    Env.myVersion.then(
            (value) => Env.versionApp = "${value.version}+${value.buildNumber}");

    return _instance;
  }

  static EnvMode get mode => _instance._mode;

  static EnvOptions? get options => _instance._options;

  static const String _apiProduction = "https://comicvine.gamespot.com/api";
  static const String _apiSandbox = "https://comicvine.gamespot.com/api";
  static const String _apiLocal = "http://192.168.10.169:8001";

  static const String _iOSLabel = "KHC Admin";
  static const String _androidLabel = "KHC Admin";

  static String versionApp = "";

  static String get playStoreUrl =>
      "";

  static String get androidAppId => "com.lukebrydev.comic_book_app";

  String get featureFlagEnv {
    switch (_instance._mode) {
      case EnvMode.production:
        return "production";
      case EnvMode.sandbox:
        return "SandBox";
      case EnvMode.local:
        return "";
      case EnvMode.releaseCandidate:
        return "";
      case EnvMode.discontinued:
        return "";
    }
  }

  static String get api {
    switch (_instance._mode) {
      case EnvMode.production:
      case EnvMode.discontinued:
      case EnvMode.releaseCandidate:
        return _apiProduction;
      case EnvMode.sandbox:
        return _apiSandbox;
      case EnvMode.local:
        return _apiLocal;
    }
  }

  static String get stage {
    switch (_instance._mode) {
      case EnvMode.production:
        return "";
      case EnvMode.releaseCandidate:
        return "-rc.${_instance._options?.numberReleaseCandidate ?? ''}";
      case EnvMode.sandbox:
        return "-b.${_instance._options?.stageNumberSandbox ?? ''}";
      case EnvMode.local:
        return "-a.${_instance._options?.stageNumberLocal ?? ''}}";
      case EnvMode.discontinued:
        return "-dc.${_instance._options?.stageNumberDiscontinued ?? ''}";
    }
  }

  static String get stageLabel {
    switch (_instance._mode) {
      case EnvMode.production:
        return "";
      case EnvMode.releaseCandidate:
        return "RC ${_instance._options?.stageNumberSandbox ?? ''}";
      case EnvMode.sandbox:
        return "BETA ${_instance._options?.stageNumberSandbox ?? ''}";
      case EnvMode.local:
        return "ALPHA ${_instance._options?.stageNumberLocal ?? ''}}";
      case EnvMode.discontinued:
        return "DISC ${_instance._options?.stageNumberDiscontinued ?? ''}";
    }
  }

  static bool get showBanner {
    switch (_instance._mode) {
      case EnvMode.production:
        return false;
      case EnvMode.releaseCandidate:
      case EnvMode.sandbox:
      case EnvMode.local:
      case EnvMode.discontinued:
        return true;
    }
  }

  static Color? get showBannerColor {
    switch (_instance._mode) {
      case EnvMode.production:
        return Colors.transparent;
      case EnvMode.sandbox:
        return Colors.red;
      case EnvMode.local:
        return null;
      case EnvMode.releaseCandidate:
        return null;
      case EnvMode.discontinued:
        return null;
    }
  }

  static String get appLabel {
    if (Platform.isIOS) {
      return _iOSLabel;
    } else if (Platform.isAndroid) {
      return _androidLabel;
    } else {
      return "";
    }
  }

  static Future<PackageInfo> get myVersion async {
    return await PackageInfo.fromPlatform();
  }
}

enum EnvMode {
  production,
  releaseCandidate,
  sandbox,
  local,
  discontinued,
}

extension EnvModeExtension on EnvMode {
  String get label {
    Map<EnvMode, String> fromStoreGpsType = {
      EnvMode.production: "production",
      EnvMode.releaseCandidate: "releaseCandidate",
      EnvMode.sandbox: "sandbox",
      EnvMode.local: "local",
      EnvMode.discontinued: "discontinued",
    };

    return fromStoreGpsType[this] ?? '';
  }
}

class EnvOptions {
  final int stageNumberProduction;
  final int stageNumberSandbox;
  final int stageNumberLocal;
  final int stageNumberDiscontinued;
  final int numberReleaseCandidate;

  const EnvOptions({
    this.stageNumberProduction = 1,
    this.stageNumberSandbox = 1,
    this.stageNumberLocal = 1,
    this.stageNumberDiscontinued = 1,
    this.numberReleaseCandidate = 1,
  });
}
