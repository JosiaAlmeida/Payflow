import 'package:flutter/material.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:payflow/shared/thems/app_colors.dart';
import 'package:payflow/shared/thems/app_text_style.dart';
import 'package:payflow/shared/widgets/bottom_sheet/bottom_sheet_widget.dart';
import 'package:payflow/shared/widgets/divider_vertical/divider_vertical_widget.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BarcodePage extends StatefulWidget {
  BarcodePage({Key? key}) : super(key: key);

  @override
  _BarcodePageState createState() => _BarcodePageState();
}

class _BarcodePageState extends State<BarcodePage> {
  final controller = BarcodeScannerController();

  //Sera chamado logo que renderizar
  @override
  void initState() {
    controller.getAvailableCameras();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.showCamera) {
                  return Container(
                    child: status.cameraController!.buildPreview(),
                  );
                } else {
                  return Container();
                }
              }),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  leading: BackButton(
                    color: AppColors.background,
                  ),
                  backgroundColor: Colors.black,
                  title: Text(
                    "Escaneie o codigo de barras",
                    style: AppTextStyles.buttonBackground,
                  ),
                  centerTitle: true,
                ),
                body: Column(
                  children: [
                    Expanded(
                        child: Container(
                      color: Colors.black,
                    )),
                    Expanded(
                        flex: 2, child: Container(color: Colors.transparent)),
                    Expanded(
                        child: Container(
                      color: Colors.black,
                    )),
                  ],
                ),
                bottomNavigationBar: SetLabelButtons(
                  primaryLabel: "Inserir codigo do boleto",
                  primaryOnPressed: () {},
                  secondaryLabel: "Adicionar da galeria",
                  secondaryOnPressed: () {},
                )),
          ),
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.hasError) {
                  return BottomSheetWidget(
                      primaryLabel: "Tente escanear novamente",
                      primaryOnPressed: () {
                        controller.getAvailableCameras();
                      },
                      secondaryLabel: "Digitar codigo de barra",
                      secondaryOnPressed: () {},
                      title:
                          "Não foi possível identificar um código de barras.",
                      subtitle:
                          "Tente escanear novamente ou digite o código do seu boleto");
                } else {
                  return Container();
                }
              }),
        ],
      ),
    );
  }
}
