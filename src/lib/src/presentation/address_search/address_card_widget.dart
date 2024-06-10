import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selecao_app/src/constants/app_theme.dart';
import 'package:selecao_app/src/constants/visual_file_components.dart';
import 'package:selecao_app/src/domain/viacep_data_model.dart';

class AddressCardWidget extends StatelessWidget {
  const AddressCardWidget({super.key, required this.addressList});

  final List<ViacepDataModel> addressList;

  @override
  Widget build(BuildContext context) {
    if (addressList.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: Center(
          child: Column(
            children: [
              SvgPicture.asset(
                addressLocationSVG,
                fit: BoxFit.scaleDown,
                height: 150,
              ),
              const Text(
                "Digite o CEP para adicionar um endereço",
                style: AppTheme.listItemSubtitleText,
              ),
            ],
          ),
        ),
      );
    }

    // If there is data then show this
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: addressList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: SizedBox(
            width: double.maxFinite,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "CEP:",
                      style: AppTheme.title,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      addressList[index].cep,
                      style: AppTheme.listItemSubtitleText,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Bairro:",
                              style: AppTheme.title,
                            ),
                            const SizedBox(height: 3),
                            Text(
                              addressList[index].bairro,
                              style: AppTheme.listItemSubtitleText,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Cidade:",
                              style: AppTheme.title,
                            ),
                            const SizedBox(height: 3),
                            Text(
                              addressList[index].localidade,
                              style: AppTheme.listItemSubtitleText,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "UF:",
                              style: AppTheme.title,
                            ),
                            const SizedBox(height: 3),
                            Text(
                              addressList[index].uf,
                              style: AppTheme.listItemSubtitleText,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Logradouro:",
                      style: AppTheme.title,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      addressList[index].logradouro,
                      style: AppTheme.listItemSubtitleText,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
