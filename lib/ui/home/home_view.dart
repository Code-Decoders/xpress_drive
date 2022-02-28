import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xpress_drive/app/app.locator.dart';
import 'package:xpress_drive/app/app.router.dart';
import 'package:xpress_drive/datamodels/folder.dart';
import 'package:xpress_drive/ui/home/home_viewmodel.dart';
import 'package:xpress_drive/ui/setup_dialog_ui.dart';
import 'package:xpress_drive/ui/widget/dialog/delete_confirm.dart';
import 'package:xpress_drive/ui/widget/tiles/folder_tile.dart';
import 'package:xpress_drive/ui/widget/color.dart';
import 'package:xpress_drive/ui/widget/dropdown/dropdown.dart';
import 'package:xpress_drive/ui/widget/icons/icon.dart';
import 'package:xpress_drive/ui/widget/textfields/search_field.dart';
import 'package:xpress_drive/ui/widget/tiles/menu_tile.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: const Size(375, 812),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.landscape);
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            drawer: _drawer(model, context),
            body: SafeArea(
              bottom: false,
              child: Padding(
                padding: EdgeInsets.fromLTRB(30.h, 27.h, 30.h, 0.h),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Your Xpress Drive',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.primary,
                          ),
                        ),
                        Builder(builder: (context) {
                          return InkWell(
                              customBorder: const CircleBorder(),
                              onTap: () {
                                Scaffold.of(context).openDrawer();
                              },
                              child: Padding(
                                padding: EdgeInsets.all(8.0.h),
                                child: AppIcon(AppIcons.menu,
                                    size: 19.h, color: AppColor.primary),
                              ));
                        }),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    SearchField(
                        hint: 'Search Folder',
                        value: model.searchText,
                        onChanged: model.setSearchText),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      children: [
                        Dropdown<Filter>(
                            items: Filter.values,
                            value: model.filter,
                            onChanged: model.setFilter,
                            itemBuilder: (filter) {
                              return Text(
                                filter.name.replaceAll('_', ' '),
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: AppColor.primary,
                                    fontWeight: FontWeight.w500),
                              );
                            }),
                        Expanded(child: SizedBox.fromSize()),
                        InkWell(
                          customBorder: const CircleBorder(),
                          onTap: () {
                            model.setView(View.List);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10.h),
                            child: AppIcon(AppIcons.list,
                                size: 15.h,
                                color: AppColor.primary.withOpacity(
                                    model.view == View.List ? 1 : 0.5)),
                          ),
                        ),
                        InkWell(
                          customBorder: const CircleBorder(),
                          onTap: () {
                            model.setView(View.Grid);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10.h),
                            child: AppIcon(AppIcons.grid,
                                size: 15.h,
                                color: AppColor.primary.withOpacity(
                                    model.view == View.Grid ? 1 : 0.5)),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding: EdgeInsets.symmetric(vertical: 30.h),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: model.view == View.List ? 1 : 2,
                            childAspectRatio:
                                model.view == View.Grid ? 1.37 : 5,
                            crossAxisSpacing: 20.h,
                            mainAxisSpacing:
                                model.view == View.List ? 0 : 20.h),
                        itemBuilder: (context, index) {
                          return FolderTile(
                            view: model.view,
                            folder: model.folders[index],
                            onTap: () {
                              model.navigateToFolder(index);
                            },
                            onEdit: () {
                              model.navigateToEditFolder(index);
                            },
                            onDelete: () async {
                              print('delete');
                              var data =
                                  await locator<DialogService>().showDialog(
                                title: 'Test Dialog Title',
                                description: 'Test Dialog Description',
                                dialogPlatform: DialogPlatform.Cupertino,
                              );
                              print(data);
                            },
                            color: (index + 1) % 4 == 0
                                ? AppColor.green
                                : (index + 1) % 4 == 3
                                    ? AppColor.red
                                    : (index + 1) % 4 == 2
                                        ? AppColor.yellow
                                        : AppColor.primaryDark,
                          );
                        },
                        itemCount: model.folders.length,
                      ),
                    )
                  ],
                ),
              ),
            ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                shape: const CircleBorder(),
                color: AppColor.primary,
                child: InkWell(
                  onTap: model.navigateToCreateFolder,
                  customBorder: const CircleBorder(),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(25.h),
                    child: Icon(
                      Icons.add,
                      size: 19.h,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  Container _drawer(HomeViewModel model, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: AppColor.primaryLight,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 107.h,
                width: 210.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(53.5.h)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: SafeArea(
                  child: Row(
                    children: [
                      AppIcon(
                        AppIcons.profile,
                        size: 40.h,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Kunal Jain',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColor.primary,
                            ),
                          ),
                          Text(
                            'Gujarat, India',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColor.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.w),
                child: Material(
                  color: Colors.transparent,
                  shape: const CircleBorder(),
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () {
                      print('close');
                      model.closeDrawer();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.close, color: AppColor.primary),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 108.h,
          ),
          MenuTile(path: '/', title: 'Home'),
          MenuTile(path: 'profile', title: 'Profile'),
          MenuTile(path: 'storage', title: 'Storage'),
          MenuTile(path: 'shared', title: 'Shared'),
          MenuTile(path: 'stats', title: 'Stats'),
          MenuTile(path: 'settings', title: 'Settings'),
          MenuTile(path: 'help', title: 'Help'),
          const Expanded(child: SizedBox.shrink()),
          Padding(
            padding: EdgeInsets.fromLTRB(30.w, 0, 0, 62.h),
            child: Material(
              color: Colors.transparent,
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 90.w,
                  child: InkWell(
                    onTap: () {
                      /// TODO: Logout
                    },
                    child: Row(
                      children: [
                        AppIcon(
                          AppIcons.power,
                          size: 20.h,
                          color: AppColor.primary,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30.w, 0, 0, 30.h),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Version 1.0.0',
                style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 10,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
