import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/routes.dart';
import '../cubit/on_boarding_cubit.dart';
import '../cubit/onboarding_state.dart';
import 'onboareding_slide_1.dart';
import 'onboareding_slide_2.dart';

const _titleList = ["Welcome to Task", "Don't miss a thing"];

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        body: BlocProvider<OnBoardingCubit>(
          create: (context) => OnBoardingCubit(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: BlocListener<OnBoardingCubit,OnBoardingState>(
              listener: (context,state){
                if(state.isOnBoardingComplete) {
                  context.go(Routes.home);
                }
              },
              child: Column(
                children: [TopRightAvatar(), MainContent(controller: controller), BottomControls(controller: controller)],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TopRightAvatar extends StatelessWidget {
  const TopRightAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: CircleAvatar(child: Text("A")),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key,required this.controller});
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<OnBoardingCubit>();
    return Expanded(
      child: PageView.builder(
        itemCount: _titleList.length,
        itemBuilder: (context, index) => index == 0
            ? OnboardingSide1(title: _titleList[0])
            : OnboardingSide2(title: _titleList[1],onButtonClick:cubit.onButtonClick),
        controller: controller,
        onPageChanged: cubit.onPageChanged,
      ),
    );
  }
}

class BottomControls extends StatelessWidget {
  const BottomControls({super.key,required this.controller});

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) => SizedBox(
        height: 20,
        child: Stack(
          children: [
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...List<Widget>.generate(_titleList.length, (index) {
                    if (index == _titleList.length - 1) {
                      return Indicator(isActive: index == state.currentPage);
                    } else {
                      return Row(
                        children: [
                          Indicator(isActive: index == state.currentPage),
                          SizedBox(width: 10),
                        ],
                      );
                    }
                  }),
                ],
              ),
            ),
            if (state.currentPage != _titleList.length-1)
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  child: Icon(Icons.arrow_forward_ios, size: 20),
                  onTap: () => controller.nextPage(duration: const Duration(milliseconds: 250), curve: Curves.ease),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Theme.of(context).colorScheme.onSurface : Theme.of(context).colorScheme.outline,
      ),
    );
  }
}
