import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class GetTimeToTravelCall {
  static Future<ApiCallResponse> call({
    String source = '',
    String destination = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Time to Travel',
      apiUrl:
          'https://api.mapbox.com/directions-matrix/v1/mapbox/driving-traffic/${source};${destination}?access_token=pk.eyJ1IjoiZGhydXYtIiwiYSI6ImNsNWh0anhxOTAxa2szanA1dDA3MWJzazUifQ.IW-_Ki3bvLZVKDgMXs7VoA',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }

  static dynamic timeToReach(dynamic response) => getJsonField(
        response,
        r'''$.durations[0][1]''',
      );
}

class MessagesCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'messages',
      apiUrl:
          ' https://api.twilio.com/2010-04-01/Accounts/ACbe4163d3a25209cf6e3190df428c013f/Messages.json',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Basic QUNiZTQxNjNkM2EyNTIwOWNmNmUzMTkwZGY0MjhjMDEzZjoyMDI0N2I5OGRlYTliNjgyNTA4ZjZiYzZlNmJlOTlkMg==',
      },
      params: {},
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
    );
  }
}
