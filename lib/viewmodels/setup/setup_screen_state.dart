import 'package:centaur_scores_2/data/servicemodel/match_basic_data.dart';

class SetupScreenState {
  final String serverUri;
  final String serverSecret;
  final MatchBasicData? selectedMatch;
  final bool alwaysUseActiveMatch;
  final String deviceID;
  final bool isQrScannerActive;

  SetupScreenState({
    required this.serverUri,
    required this.serverSecret,
    required this.selectedMatch,
    required this.alwaysUseActiveMatch,
    required this.deviceID,
    required this.isQrScannerActive,
  });

  static SetupScreenState empty() => SetupScreenState(
    serverUri: "",
    serverSecret: "",
    selectedMatch: null,
    alwaysUseActiveMatch: true,
    deviceID: "",
    isQrScannerActive: false,
  );

  SetupScreenState copyWith({
    String? serverUri,
    String? serverSecret,
    MatchBasicData? selectedMatch,
    bool? alwaysUseActiveMatch,
    String? deviceID,
    bool? isQrScannerActive,
  }) => SetupScreenState(
    serverUri: serverUri ?? this.serverUri,
    serverSecret: serverSecret ?? this.serverSecret,
    selectedMatch: selectedMatch ?? this.selectedMatch,
    alwaysUseActiveMatch: alwaysUseActiveMatch ?? this.alwaysUseActiveMatch,
    deviceID: deviceID ?? this.deviceID,
    isQrScannerActive: isQrScannerActive ?? this.isQrScannerActive,
  );
}
