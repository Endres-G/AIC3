import 'package:aic_lll/core/widgets/loading_widget.dart';
import 'package:aic_lll/home/controller/home_controller.dart';
import 'package:aic_lll/home/models/request_card_model.dart';
import 'package:aic_lll/home/view/widgets/request_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class RequestList extends GetView<HomeController> {
  const RequestList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: controller.isLoading.value
              ? const LoadingWidget()
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Lista de pedidos",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        RequestCard(
                          requestCardModel: RequestCardModel(
                              pendingDay: DateTime(1222),
                              pendingId: "pendingId",
                              client: "asd",
                              totalValue: 123),
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
