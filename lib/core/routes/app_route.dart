import 'package:auto_route/auto_route.dart';
import 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LandingScreen.page, initial: true),
        AutoRoute(page: SwipperScreen.page, path: '/guide'),
        AutoRoute(page: DashboardScreen.page, path: '/dashboard'),
        AutoRoute(page: CallScreen.page, path: '/call'),
        AutoRoute(page: ChatScreen.page, path: '/chat'),
        AutoRoute(page: JournalScreen.page, path: '/journal'),
        AutoRoute(page: TimerScreen.page, path: '/timer'),
        AutoRoute(page: GrowthjournalScreen.page, path: '/growthjournal'),
        AutoRoute(page: LoginScreen.page, path: '/login'),
        AutoRoute(page: SignupSceen.page, path: '/signup'),
        AutoRoute(page: SettingsScreen.page, path: '/settings'),
        AutoRoute(page: ProfileModal.page, path: '/profile'),
      ];
}
