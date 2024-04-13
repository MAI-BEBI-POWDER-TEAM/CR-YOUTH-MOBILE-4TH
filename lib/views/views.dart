// import 'dart:developer';

import 'package:cat_api/data/api/controller/cat_controller.dart';
import 'package:cat_api/data/api/response/breed_response.dart';
import 'package:cat_api/data/local/localdb/pet_db.dart';
import 'package:cat_api/data/local/model/pet.dart';
import 'package:cat_api/utils/color_theme.dart';
import 'package:cat_api/utils/endpoint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slider_button/slider_button.dart';

// Home
part 'home/home_views.dart';
part 'home/onboard/onboarding_views.dart';
part 'home/pets/select_pet_views.dart';
part 'home/pets/name_pet_views.dart';
part 'home/pets/weight_pet_views.dart';
part 'home/pets/age_pet_views.dart';
part 'home/pets/widgets/pet_grid_widgets.dart';
part 'home/pets/widgets/mypet_grid_widgets.dart';

// Detail
part 'details/details_views.dart';

// Widget
part 'widgets/no_data_widget.dart';
