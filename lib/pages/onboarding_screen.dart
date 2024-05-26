import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawtech/cubit/app_cubits.dart';
import 'package:lawtech/info/on_boarding_info.dart';
import 'package:lawtech/misc/colors.dart';
import 'package:lawtech/widgets/app_text.dart';
import 'package:lawtech/widgets/app_text_large.dart';
import 'package:lawtech/widgets/responsive_button.dart';
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: OnBoardingInfo.images.length,
          itemBuilder: (_, index) {
            return Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                  "img/${OnBoardingInfo.images[index]}"
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 260,
                          child: AppTextLarge(text: OnBoardingInfo.headers[index], size: 36),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                            width: 260,
                            child: AppText(text: OnBoardingInfo.subHeaders[index], size: 24, weight: FontWeight.w600),
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          width: 250,
                          child: AppText(
                            text: OnBoardingInfo.description[index],
                            color: AppColors.textColor2,
                            size: 17,
                          ),
                        ),
                        const SizedBox(height: 40,),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context).goToLogin();
                          },
                          child: Container(
                            width: 200,
                              child: Row(
                                children: [
                                  ResponsiveButton(width: 120,),
                                ],
                              )
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: List.generate(OnBoardingInfo.images.length, (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 4),
                          width: 8,
                          height: index == indexDots? 40: 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == indexDots? AppColors.mainColor: AppColors.mainColor.withOpacity(0.3),
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
      }),
    );
  }
}
