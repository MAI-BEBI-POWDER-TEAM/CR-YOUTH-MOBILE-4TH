part of '../../views.dart';

class NamingPetScreenViews extends StatefulWidget {
  final String imageUrl;
  final String breed;

  const NamingPetScreenViews({
    super.key,
    required this.imageUrl,
    required this.breed,
  });

  @override
  State<NamingPetScreenViews> createState() => _NamingPetScreenViewsState();
}

class _NamingPetScreenViewsState extends State<NamingPetScreenViews> {
  final _nameFormKey = GlobalKey<FormState>();
  final TextEditingController _nameEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimaryBlack,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
            Get.back();
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
        backgroundColor: colorPrimaryBlack,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Pet Name',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 16),
            LinearProgressIndicator(
              color: colorAccentYellow,
              value: 50 / 100,
            ),
          ],
        ),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            height: MediaQuery.of(context).size.height - 200,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 340,
                  height: 340,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(
                        widget.imageUrl,
                      ),
                    ),
                  ),
                ),
                buildFormName(),
                TextButton(
                  onPressed: () {
                    if (_nameFormKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) {
                            return WeightPetScreenViews(
                              name: _nameEditingController.text,
                              breed: widget.breed,
                              imageUrl: widget.imageUrl,
                            );
                          },
                          transitionsBuilder: (_, animation, __, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                      );
                    } else {
                      Get.snackbar(
                        'CatAPI',
                        'Please enter your pet\'s name!',
                        colorText: Colors.white,
                        backgroundColor: colorSecondaryBlack,
                      );
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: colorAccentBlue1,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      60,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Confirm?',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildFormName() {
    return Column(
      children: [
        const Text(
          'What\'s your pet\'s name?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 62),
        Form(
          key: _nameFormKey,
          child: TextFormField(
            controller: _nameEditingController,
            keyboardType: TextInputType.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            validator: (value) {
              return value == null || value.isEmpty
                  ? 'Name should be filled!'
                  : null;
            },
            decoration: const InputDecoration(
              hintText: 'Enter your pet\'s name',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              isDense: true,
              filled: true,
              fillColor: colorSecondaryBlack,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
