part of '../../views.dart';

class OnBoardingScreenViews extends StatefulWidget {
  const OnBoardingScreenViews({super.key});

  @override
  State<OnBoardingScreenViews> createState() => _OnBoardingScreenViewsState();
}

class _OnBoardingScreenViewsState extends State<OnBoardingScreenViews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimaryBlack,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorPrimaryBlack,
        title: const Text(
          'Welcome!',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              const NoDataWidgets(
                message:
                    'Looks like you have no profiles set up at this moment, add your pet now',
              ),
              SliderButton(
                radius: 24,
                width: MediaQuery.of(context).size.width,
                backgroundColor: colorAccentBlue2,
                buttonColor: colorAccentBlue1,
                icon: const Icon(
                  CupertinoIcons.arrow_right_circle,
                  color: Colors.white,
                  size: 32,
                ),
                label: const Text(
                  'Swipe to continue',
                  style: TextStyle(
                    fontSize: 18,
                    color: colorAccentBlue1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                shimmer: false,
                alignLabel: Alignment.center,
                action: () async {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const SelectPetScreenViews(),
                      transitionsBuilder: (_, animation, __, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    ),
                  );

                  return false;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
