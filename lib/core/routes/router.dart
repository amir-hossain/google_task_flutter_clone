import 'package:go_router/go_router.dart';
import 'package:google_todo_clone/core/routes/routes.dart';

import '../../features/home/view/home_page.dart';
import '../../features/onboarding/view/on_boarding_page.dart';


GoRouter router() => GoRouter(
  initialLocation: Routes.onBoarding,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: Routes.onBoarding,
      builder: (context, state) {
        return OnBoardingPage();
      },
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, state) {
        return HomePage();
      },
    ),
  ],
);
