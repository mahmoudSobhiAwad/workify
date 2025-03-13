import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:workify/core/routing/routes.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_icons.dart';
import 'package:workify/core/utils/theme/app_images.dart';
import 'package:workify/features/admin/company/data/models/company_model.dart';
import 'package:workify/features/employee/company_select/presentation/cubit/company_selector_cubit.dart';
import 'package:workify/shared/features/on_boarding/presentation/widgets/custom_push_button.dart';
import 'package:workify/shared/widgets/custom_cached_image.dart';
import 'package:workify/shared/widgets/custom_text_form_field.dart';
import 'package:workify/shared/widgets/error_widget.dart';
import 'package:workify/shared/widgets/shimmer_loading.dart';

class CompanySelectPage extends StatefulWidget {
  const CompanySelectPage({super.key});

  @override
  State<CompanySelectPage> createState() => _CompanySelectPageState();
}

class _CompanySelectPageState extends State<CompanySelectPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CompanySelectorCubit>(
      create: (context) => CompanySelectorCubit()..loadAllCompanies(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CompanySelectorBody(),
        )),
      ),
    );
  }
}

class CompanySelectorBody extends StatefulWidget {
  const CompanySelectorBody({
    super.key,
  });

  @override
  State<CompanySelectorBody> createState() => _CompanySelectorBodyState();
}

class _CompanySelectorBodyState extends State<CompanySelectorBody> {
  int _selectedIndex = -1;
  List<CompanyModel> compainesList = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(AppImages.assetsImagesAppLogo),
        SizedBox(
          height: 25,
        ),
        Text(
          'company_select.select_company'.tr(),
          style: AppFontStyle.bold21,
        ),
        SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          hintText: "company_select.search".tr(),
        ),
        SizedBox(
          height: 30,
        ),
        BlocBuilder<CompanySelectorCubit, CompanySelectorState>(
          builder: (context, state) {
            if (state is LoadingGetAllCompainesState) {
              return Expanded(
                  child: ShimmerGrid(
                shape: BoxShape.circle,
              ));
            } else if (state is FailureGetAllCompainesState) {
              return ErrorWidgetState(errMessage: state.errMessage);
            } else if (state is SuccessGetAllCompainesState) {
              compainesList = state.compainesList;
            } else if (state is ChangeSelectedCompanyState) {
              _selectedIndex = state.value;
            }
            return Expanded(
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: compainesList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context
                                .read<CompanySelectorCubit>()
                                .changeSelector(index);
                          },
                          child: Container(
                            width: 105,
                            height: 105,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: AppColors.whiteWithOpacity10,
                                shape: BoxShape.circle,
                                border: _selectedIndex == index
                                    ? Border.all(
                                        width: 4,
                                        color: AppColors.purblePrimary,
                                      )
                                    : null),
                            child: compainesList[index].companyLogo != null
                                ? ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    child: CustomCachedImage(
                                      imagePath:
                                          compainesList[index].companyLogo!,
                                    ),
                                  )
                                : null,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          compainesList[index].companyName,
                          style: AppFontStyle.semiBold18,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    );
                  }),
            );
          },
        ),
        SizedBox(
          height: 20,
        ),
        BlocBuilder<CompanySelectorCubit, CompanySelectorState>(
          builder: (context, state) {
            return CustomPushButton(
              onTap: _selectedIndex != -1
                  ? () {
                      context.push(Routes.employeeLogin,
                          extra: compainesList[_selectedIndex]);
                    }
                  : null,
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              backgroundColor: _selectedIndex == -1
                  ? AppColors.whiteWithOpacity10
                  : AppColors.purblePrimary,
              child: Row(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "company_select.next".tr(),
                    style: AppFontStyle.semiBold16,
                    textAlign: TextAlign.start,
                  ),
                  RotatedBox(
                    quarterTurns: context.locale.languageCode == 'en' ? 0 : 2,
                    child: SvgPicture.asset(
                      AppIcons.assetsIconsArrowRightBroken,
                      height: 18,
                      width: 18,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
