import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_tik/features/home/view/repo_details.dart';

import '../../../../core/components/custom_refresh/src/smart_refresher.dart';
import '../../../core/app/app_context.dart';
import '../../../core/components/custom_refresh/refresher.dart';
import '../../../core/constants/theme_color.dart';
import '../../theme/cubit/theme_cubit.dart';
import '../cubit/home_cubit.dart';
import '../widget/repository_card.dart';
import '../widget/search_field.dart';

class RepositoryHomeScreen extends StatefulWidget {
  const RepositoryHomeScreen({super.key});

  @override
  State<RepositoryHomeScreen> createState() => _RepositoryHomeScreenState();
}

class _RepositoryHomeScreenState extends State<RepositoryHomeScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().refreshController =
        RefreshController(initialRefresh: false);
    context.read<HomeCubit>().page = 1;
    context.read<HomeCubit>().getRepoList(perPage: 10);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, themeState) {
            final theme = ThemeColor(themeState.themeMode);
            return Scaffold(
                appBar: AppBar(
                  centerTitle: false,
                  title: Text(
                    'Repositories',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  actions: [
                    Row(
                      children: [
                        Text('Dark mode', style: TextStyle(fontSize: 14)),
                        CupertinoSwitch(
                          value: themeState.themeMode == ThemeModeStatus.dark,
                          onChanged: (bool val) {
                            context.read<ThemeCubit>().toggleTheme();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                body: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 12.h),
                      child: SearchTextField(
                        controller: context.read<HomeCubit>().searchController,
                        onChanged: (text) {
                          context
                              .read<HomeCubit>()
                              .getRepoList(text: text, isSearch: true);
                        },
                      ),
                    ),
                    Expanded(
                      child: customRefresher(
                        controller: context.read<HomeCubit>().refreshController,
                        onRefresh: () => context
                            .read<HomeCubit>()
                            .getRepoList(isLoader: false),
                        onLoading: () {
                          context
                              .read<HomeCubit>()
                              .getRepoList(isLoader: false);
                        },
                        enablePullUp: state.hasReachedMax ? false : true,
                        child: ListView.separated(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            itemCount: (state.repoList ?? []).length,
                            itemBuilder: (context, index) {
                              return RepositoryCard(
                                onTap: () {
                                  AppContext.to(RepositoryDetailsPage(
                                      repository: state.repoList[index]));
                                },
                                items: state.repoList[index],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return 10.verticalSpace;
                            }),
                      ),
                    ),
                  ],
                ));
          },
        );
      },
    );
  }
}
