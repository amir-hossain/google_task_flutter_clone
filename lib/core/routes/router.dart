import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_todo_clone/core/routes/routes.dart';
import '../../features/onboarding/presentation/pages/on_boarding_page.dart';
import '../../features/task/home/presentation/cubit/home/home_cubit.dart';
import '../../features/task/home/presentation/pages/home_page.dart';

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
        return BlocProvider<HomeCubit>(
            create: (context) =>HomeCubit(),
            child: HomePage());
      },
    ),
  ],
);
