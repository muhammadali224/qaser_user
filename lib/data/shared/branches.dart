import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../model/branches_model/branches_model.dart';

List<BranchesModel> branchesList = [];

Rx<BranchesModel> selectedBranch = BranchesModel().obs;
