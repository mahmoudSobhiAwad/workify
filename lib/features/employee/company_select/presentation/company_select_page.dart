import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_images.dart';
import 'package:workify/features/employee/company_select/domain/company_model.dart';
import 'package:workify/features/employee/login/presentation/employee_login_page.dart';

import '../../../../core/utils/theme/app_icons.dart';
import '../../../../shared/features/on_boarding/presentation/widgets/custom_push_button.dart';

class CompanySelectPage extends StatefulWidget {
  const CompanySelectPage({super.key});

  @override
  State<CompanySelectPage> createState() => _CompanySelectPageState();
}

class _CompanySelectPageState extends State<CompanySelectPage> {
  int _selectedCompany = -1;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SvgPicture.asset(AppImages.assetsImagesAppLogo),
            SizedBox(
              height: 25,
            ),
            Text(
              'Select Your Company',
              style: AppFontStyle.bold21,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'search',
                hintStyle:
                    TextStyle(color: Colors.grey.shade500, fontSize: 16),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    AppIcons.assetsIconsSearchIcon,
                  ),
                ),
                filled: true,
                fillColor: AppColors.whiteWithOpacity10,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: companyList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          overlayColor: WidgetStatePropertyAll(
                            AppColors.scaffoldBackgroundColor,
                          ),
                          onTap: () {
                            _selectedCompany = index;
                            setState(() {});
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: AppColors.whiteWithOpacity10,
                                shape: BoxShape.circle,
                                border: _selectedCompany == index
                                    ? Border.all(
                                        width: 4,
                                        color: AppColors.purblePrimary,
                                      )
                                    : null),
                            child: SvgPicture.asset(
                              companyList[index].imagePath,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          companyList[index].companyName,
                          style: AppFontStyle.semiBold18,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    );
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            CustomPushButton(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeLoginPage()));
              },
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              backgroundColor: AppColors.purblePrimary,
              child: Row(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Next",
                    style: AppFontStyle.semiBold16,
                    textAlign: TextAlign.start,
                  ),
                  SvgPicture.asset(
                    AppIcons.assetsIconsArrowRightBroken,
                    height: 18,
                    width: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
