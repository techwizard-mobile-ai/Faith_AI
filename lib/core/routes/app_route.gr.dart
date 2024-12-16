// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i18;
import 'package:myfriendfaith/screens/call_screen.dart' as _i2;
import 'package:myfriendfaith/screens/chat_screen.dart' as _i3;
import 'package:myfriendfaith/screens/dashboard_screen.dart' as _i4;
import 'package:myfriendfaith/screens/growthjournal_screen.dart' as _i5;
import 'package:myfriendfaith/screens/journal_screen.dart' as _i6;
import 'package:myfriendfaith/screens/landing_screen.dart' as _i7;
import 'package:myfriendfaith/screens/login_screen.dart' as _i8;
import 'package:myfriendfaith/screens/settings_screen.dart' as _i12;
import 'package:myfriendfaith/screens/signup_screen.dart' as _i13;
import 'package:myfriendfaith/screens/swipper_screen.dart' as _i14;
import 'package:myfriendfaith/screens/timer_screen.dart' as _i15;
import 'package:myfriendfaith/widgets/modals/about_modal.dart' as _i1;
import 'package:myfriendfaith/widgets/modals/prayerExperience_modal.dart'
    as _i9;
import 'package:myfriendfaith/widgets/modals/privacyPolicy_modal.dart' as _i10;
import 'package:myfriendfaith/widgets/modals/profile_modal.dart' as _i11;
import 'package:myfriendfaith/widgets/modals/tos_modal.dart' as _i16;
import 'package:myfriendfaith/widgets/modals/voicePreference_modal.dart'
    as _i17;
import 'package:flutter/material.dart' as _i19;

abstract class $AppRouter extends _i18.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i18.PageFactory> pagesMap = {
    AboutModal.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AboutModal(),
      );
    },
    CallScreen.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CallScreen(),
      );
    },
    ChatScreen.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ChatScreen(),
      );
    },
    DashboardScreen.name: (routeData) {
      final args = routeData.argsAs<DashboardScreenArgs>();
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.DashboardScreen(
          key: args.key,
          displayName: args.displayName,
        ),
      );
    },
    GrowthjournalScreen.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.GrowthjournalScreen(),
      );
    },
    JournalScreen.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.JournalScreen(),
      );
    },
    LandingScreen.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.LandingScreen(),
      );
    },
    LoginScreen.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.LoginScreen(),
      );
    },
    PrayerExperienceModal.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.PrayerExperienceModal(),
      );
    },
    PrivacyPolicyModal.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.PrivacyPolicyModal(),
      );
    },
    ProfileModal.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ProfileModal(),
      );
    },
    SettingsScreen.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SettingsScreen(),
      );
    },
    SignupSceen.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SignupSceen(),
      );
    },
    SwipperScreen.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.SwipperScreen(),
      );
    },
    TimerScreen.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.TimerScreen(),
      );
    },
    TosModal.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.TosModal(),
      );
    },
    VoicePreferenceModal.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.VoicePreferenceModal(),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutModal]
class AboutModal extends _i18.PageRouteInfo<void> {
  const AboutModal({List<_i18.PageRouteInfo>? children})
      : super(
          AboutModal.name,
          initialChildren: children,
        );

  static const String name = 'AboutModal';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CallScreen]
class CallScreen extends _i18.PageRouteInfo<void> {
  const CallScreen({List<_i18.PageRouteInfo>? children})
      : super(
          CallScreen.name,
          initialChildren: children,
        );

  static const String name = 'CallScreen';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ChatScreen]
class ChatScreen extends _i18.PageRouteInfo<void> {
  const ChatScreen({List<_i18.PageRouteInfo>? children})
      : super(
          ChatScreen.name,
          initialChildren: children,
        );

  static const String name = 'ChatScreen';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i4.DashboardScreen]
class DashboardScreen extends _i18.PageRouteInfo<DashboardScreenArgs> {
  DashboardScreen({
    _i19.Key? key,
    required String? displayName,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          DashboardScreen.name,
          args: DashboardScreenArgs(
            key: key,
            displayName: displayName,
          ),
          initialChildren: children,
        );

  static const String name = 'DashboardScreen';

  static const _i18.PageInfo<DashboardScreenArgs> page =
      _i18.PageInfo<DashboardScreenArgs>(name);
}

class DashboardScreenArgs {
  const DashboardScreenArgs({
    this.key,
    required this.displayName,
  });

  final _i19.Key? key;

  final String? displayName;

  @override
  String toString() {
    return 'DashboardScreenArgs{key: $key, displayName: $displayName}';
  }
}

/// generated route for
/// [_i5.GrowthjournalScreen]
class GrowthjournalScreen extends _i18.PageRouteInfo<void> {
  const GrowthjournalScreen({List<_i18.PageRouteInfo>? children})
      : super(
          GrowthjournalScreen.name,
          initialChildren: children,
        );

  static const String name = 'GrowthjournalScreen';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i6.JournalScreen]
class JournalScreen extends _i18.PageRouteInfo<void> {
  const JournalScreen({List<_i18.PageRouteInfo>? children})
      : super(
          JournalScreen.name,
          initialChildren: children,
        );

  static const String name = 'JournalScreen';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i7.LandingScreen]
class LandingScreen extends _i18.PageRouteInfo<void> {
  const LandingScreen({List<_i18.PageRouteInfo>? children})
      : super(
          LandingScreen.name,
          initialChildren: children,
        );

  static const String name = 'LandingScreen';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i8.LoginScreen]
class LoginScreen extends _i18.PageRouteInfo<void> {
  const LoginScreen({List<_i18.PageRouteInfo>? children})
      : super(
          LoginScreen.name,
          initialChildren: children,
        );

  static const String name = 'LoginScreen';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i9.PrayerExperienceModal]
class PrayerExperienceModal extends _i18.PageRouteInfo<void> {
  const PrayerExperienceModal({List<_i18.PageRouteInfo>? children})
      : super(
          PrayerExperienceModal.name,
          initialChildren: children,
        );

  static const String name = 'PrayerExperienceModal';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i10.PrivacyPolicyModal]
class PrivacyPolicyModal extends _i18.PageRouteInfo<void> {
  const PrivacyPolicyModal({List<_i18.PageRouteInfo>? children})
      : super(
          PrivacyPolicyModal.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyModal';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ProfileModal]
class ProfileModal extends _i18.PageRouteInfo<void> {
  const ProfileModal({List<_i18.PageRouteInfo>? children})
      : super(
          ProfileModal.name,
          initialChildren: children,
        );

  static const String name = 'ProfileModal';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i12.SettingsScreen]
class SettingsScreen extends _i18.PageRouteInfo<void> {
  const SettingsScreen({List<_i18.PageRouteInfo>? children})
      : super(
          SettingsScreen.name,
          initialChildren: children,
        );

  static const String name = 'SettingsScreen';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SignupSceen]
class SignupSceen extends _i18.PageRouteInfo<void> {
  const SignupSceen({List<_i18.PageRouteInfo>? children})
      : super(
          SignupSceen.name,
          initialChildren: children,
        );

  static const String name = 'SignupSceen';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i14.SwipperScreen]
class SwipperScreen extends _i18.PageRouteInfo<void> {
  const SwipperScreen({List<_i18.PageRouteInfo>? children})
      : super(
          SwipperScreen.name,
          initialChildren: children,
        );

  static const String name = 'SwipperScreen';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i15.TimerScreen]
class TimerScreen extends _i18.PageRouteInfo<void> {
  const TimerScreen({List<_i18.PageRouteInfo>? children})
      : super(
          TimerScreen.name,
          initialChildren: children,
        );

  static const String name = 'TimerScreen';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i16.TosModal]
class TosModal extends _i18.PageRouteInfo<void> {
  const TosModal({List<_i18.PageRouteInfo>? children})
      : super(
          TosModal.name,
          initialChildren: children,
        );

  static const String name = 'TosModal';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i17.VoicePreferenceModal]
class VoicePreferenceModal extends _i18.PageRouteInfo<void> {
  const VoicePreferenceModal({List<_i18.PageRouteInfo>? children})
      : super(
          VoicePreferenceModal.name,
          initialChildren: children,
        );

  static const String name = 'VoicePreferenceModal';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}
