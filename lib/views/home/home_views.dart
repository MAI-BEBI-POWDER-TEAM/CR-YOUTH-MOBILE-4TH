part of '../views.dart';

class HomeScreenViews extends StatefulWidget {
  const HomeScreenViews({super.key});

  @override
  State<HomeScreenViews> createState() => _HomeScreenViewsState();
}

class _HomeScreenViewsState extends State<HomeScreenViews> {
  final TextEditingController _weightUpdateEditingController =
      TextEditingController();
  final TextEditingController _ageUpdateEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimaryBlack,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorPrimaryBlack,
        automaticallyImplyLeading: false,
        title: const Column(
          children: [
            Text(
              'Welcome!',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            Text(
              'Your pets are saved here! Click to edit them!',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        top: false,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: buildAllPetData(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const SelectPetScreenViews());
        },
        backgroundColor: colorSecondaryBlack,
        shape: const CircleBorder(),
        child: const Icon(
          CupertinoIcons.add_circled,
          color: colorAccentYellow,
          size: 32,
        ),
      ),
    );
  }

  Widget buildAllPetData() {
    return GridView.builder(
      itemCount: MyPetDB.getAllPets().length,
      itemBuilder: (context, index) {
        Pet pet = MyPetDB.getAllPets()[index];

        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: buildFormEdit(pet),
                  backgroundColor: colorPrimaryBlack,
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        String petEditWeight = '';
                        String petEditAge = '';

                        if (_ageUpdateEditingController.text.isEmpty) {
                          petEditAge = '${pet.age}';
                        } else {
                          petEditAge = _ageUpdateEditingController.text;
                        }

                        if (_weightUpdateEditingController.text.isEmpty) {
                          petEditWeight = '${pet.weight}';
                        } else {
                          petEditWeight = _weightUpdateEditingController.text;
                        }

                        Pet petEdit = Pet(
                          petName: pet.petName,
                          breed: pet.breed,
                          weight: double.parse(petEditWeight),
                          age: double.parse(petEditAge),
                          imageUrl: pet.imageUrl,
                        );

                        MyPetDB.updatePet(petEdit);
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) {
                              return const HomeScreenViews();
                            },
                            transitionsBuilder: (_, animation, __, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: const Text(
                        'Edit',
                        style: TextStyle(
                          fontSize: 16,
                          color: colorAccentBlue2,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          child: MyPetGridWidgets(
            petName: pet.petName,
            imageUrl: pet.imageUrl,
          ),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }

  Form buildFormEdit(Pet pet) {
    _weightUpdateEditingController.text = pet.weight.toString();
    _ageUpdateEditingController.text = pet.age.toString();

    return Form(
      child: SizedBox(
        height: 240,
        width: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Update pet\'s weight (Kg)',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _weightUpdateEditingController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              decoration: const InputDecoration(
                hintText: 'Edit pet\'s weight (Kg)',
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
            const SizedBox(height: 24),
            const Text(
              'Update pet\'s age',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _ageUpdateEditingController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              decoration: const InputDecoration(
                hintText: 'Edit pet\'s age',
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
          ],
        ),
      ),
    );
  }
}
