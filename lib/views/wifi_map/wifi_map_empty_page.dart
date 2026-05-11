import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:my_app_module/utils/design/app_color_extension.dart';
import 'package:my_app_module/utils/design/app_spacing_extension.dart';
import 'package:my_app_module/utils/design/app_text_styles.dart';
import 'package:my_app_module/widgets/app_image.dart';
import 'package:my_app_module/widgets/edit_floor_name_dialog.dart';
import 'package:my_app_module/viewmodels/floor/floor_viewmodel_provider.dart';
import 'package:my_app_module/models/floor_model.dart';
import 'package:my_app_module/models/room_model.dart';
import 'package:my_app_module/utils/design/app_colors.dart';
import 'package:my_app_module/utils/design/app_spacing.dart';
import 'package:my_app_module/utils/build_context_extension.dart';

class WifiMapEmptyPage extends HookConsumerWidget {
  const WifiMapEmptyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final floorsAsync = ref.watch(allFloorsProvider);

    return Scaffold(
      backgroundColor: context.appColors.fontWh1with100Opacity,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: statusBarHeight),
          Container(
            height: kToolbarHeight,
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.pad16.w),
            child: Row(
              children: [
                Expanded(child: _buildBackButton(context)),
                Expanded(child: _buildAddFloorButton(context, ref)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: AppSpacing.pad16.w,
            ),
            child: const _PageTitle(),
          ),
          Expanded(
            child: floorsAsync.when(
              data: (floors) {
                if (floors.isEmpty) {
                  return _buildEmptyState();
                }
                return _buildFloorList(context, floors, ref);
              },
              loading: () => const SizedBox(),
              error: (_, __) => const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.pad16.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const _EmptyStateTitle(),
            SizedBox(height: AppSpacing.gap12.h),
            const _EmptyStateDescription(),
          ],
        ),
      ),
    );
  }

  Widget _buildFloorList(BuildContext context, List<FloorModel> floors, WidgetRef ref) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 16),
      shrinkWrap: true,
      itemCount: floors.length,
      itemBuilder: (context, index) {
        final floor = floors[index];
        return _FloorListItem(
          floor: floor,
          onTap: () {
            context.push('/wifi-map?floorId=${floor.id}');
          },
        );
      },
    );
  }
}

class _BackIcon extends StatelessWidget {
  const _BackIcon();

  @override
  Widget build(BuildContext context) {
    return AppImage(
      'chevron_left.png',
      width: AppSpacing.icon24.w,
      height: AppSpacing.icon24.h,
      color: context.appColors.fontGy1with90Opacity,
    );
  }
}

class _BackText extends StatelessWidget {
  const _BackText();

  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.back,
      style: context.appTextStyles.bodyLargeWith90Opacity,
    );
  }
}

Widget _buildBackButton(BuildContext context) {
  return GestureDetector(
    onTap: () => Navigator.of(context).pop(),
    behavior: HitTestBehavior.opaque,
    child: Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _BackIcon(),
          SizedBox(width: AppSpacing.gap8.w),
          const _BackText(),
        ],
      ),
    ),
  );
}

Widget _buildAddFloorButton(BuildContext context, WidgetRef ref) {
  return GestureDetector(
    onTap: () async {
      final floorName = await showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (context) => const EditFloorNameDialog(),
      );
      if (floorName != null && floorName.isNotEmpty) {
        final floor = await ref.read(floorViewModelProvider.notifier).createFloor(floorName);
        if (context.mounted && floor != null) {
          context.push('/wifi-map?floorId=${floor.id}');
        }
      }
    },
    behavior: HitTestBehavior.opaque,
    child: Align(
      alignment: Alignment.centerRight,
      child: Text(
        context.l10n.addFloor,
        style: context.appTextStyles.bodyLargeWith90Opacity.copyWith(
          color: context.appColors.brand6Normal,
        ),
      ),
    ),
  );
}

class _PageTitle extends StatelessWidget {
  const _PageTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.wifiMap,
      style: context.appTextStyles.titleWith90Opacity,
    );
  }
}

class _EmptyStateTitle extends StatelessWidget {
  const _EmptyStateTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.noFloorsCreated,
      style: context.appTextStyles.bodyLargeWith90Opacity,
      textAlign: TextAlign.center,
    );
  }
}

class _EmptyStateDescription extends StatelessWidget {
  const _EmptyStateDescription();

  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.addFloorHint,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: context.appColors.fontGy2with60Opacity,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _FloorListItem extends StatelessWidget {
  final FloorModel floor;
  final VoidCallback? onTap;

  const _FloorListItem({
    required this.floor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(AppSpacing.pad16.w),
        decoration: BoxDecoration(
          color: context.appColors.fontWh1with100Opacity,
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRoomsGrid(context, floor.rooms),
              SizedBox(width: AppSpacing.gap12.w),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 0.2.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            floor.floorName,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: context.appColors.fontGy1with90Opacity,
                            ),
                          ),
                          SizedBox(width: AppSpacing.gap4.w),
                          Text(
                            '(${context.l10n.zonesCount(floor.rooms.length)})',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: context.appColors.fontGy2with60Opacity,
                            ),
                          )
                        ],
                      ),
                      Text(
                        floor.updatedAt != null
                            ? DateFormat('yyyy-MM-dd HH:mm').format(floor.updatedAt!)
                            : '',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: context.appColors.fontGy2with60Opacity,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 3.h,
                        ),
                        decoration: BoxDecoration(
                          color: context.appColors.gray1,
                          borderRadius: BorderRadius.circular(3.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AppImage(
                              'no_result.png',
                              width: AppSpacing.gap16.w,
                              height: AppSpacing.gap16.h,
                              color: context.appColors.fontGy2with60Opacity,
                            ),
                            SizedBox(width: AppSpacing.gap4.w),
                            Text(
                              floor.rooms.length.toString(),
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: context.appColors.fontGy2with60Opacity,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: AppSpacing.gap16.w),
              Align(
                alignment: Alignment.center,
                child: AppImage(
                  'chevron_right.png',
                  width: AppSpacing.gap24.w,
                  height: AppSpacing.gap24.h,
                  color: context.appColors.fontGy2with60Opacity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoomsGrid(BuildContext context, List<RoomModel> rooms) {
    const baseCols = 4;
    const baseRows = 5;
    const baseCellSize = 15.0;
    const baseSpacing = 1.25;
    final totalWidth = baseCols * baseCellSize + (baseCols - 1) * baseSpacing;
    final totalHeight = baseRows * baseCellSize + (baseRows - 1) * baseSpacing;
    if (rooms.isEmpty) {
      return SizedBox(width: totalWidth.w, height: totalHeight.h);
    }
    const originalCols = 10;
    const originalRows = 11;
    final roomPositions = <Point<int>>{};
    int minX = originalCols;
    int maxX = 0;
    int minY = originalRows;
    int maxY = 0;

    for (final room in rooms) {
      final x = room.index % originalCols;
      final y = room.index ~/ originalCols;
      roomPositions.add(Point(x, y));
      if (x < minX) minX = x;
      if (x > maxX) maxX = x;
      if (y < minY) minY = y;
      if (y > maxY) maxY = y;
    }
    final xRange = maxX - minX + 1;
    final yRange = maxY - minY + 1;
    const originalAspect = 10.0 / 11.0;
    int newCols = baseCols;
    int newRows = baseRows;
    if (xRange > newCols || yRange > newRows) {
      if (xRange > newCols && xRange / yRange > originalAspect) {
        newCols = xRange;
        newRows = (xRange / originalAspect).floor();
      } else if (yRange > newRows) {
        newRows = yRange;
        newCols = (newRows * originalAspect).floor();
        if (newCols < xRange) newCols = xRange;
      }
    }
    final cellWidth = (totalWidth - (newCols - 1) * baseSpacing) / newCols;
    final cellHeight = (totalHeight - (newRows - 1) * baseSpacing) / newRows;
    final cellSize = cellWidth < cellHeight ? cellWidth : cellHeight;
    final spacing = baseSpacing * cellSize / baseCellSize;
    final radius = 2.0.r;
    final roomIndicesInNewGrid = <int>{};
    for (final pos in roomPositions) {
      final newX = pos.x - minX;
      final newY = pos.y - minY;
      final newIndex = newY * newCols + newX;
      roomIndicesInNewGrid.add(newIndex);
    }

    return SizedBox(
      width: totalWidth.w,
      height: totalHeight.h,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        clipBehavior: Clip.none,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: newCols,
          crossAxisSpacing: spacing.w,
          mainAxisSpacing: spacing.w,
          childAspectRatio: 1,
        ),
        itemCount: newCols * newRows,
        itemBuilder: (context, index) {
          final hasRoom = roomIndicesInNewGrid.contains(index);
          return Container(
            decoration: BoxDecoration(
              color: hasRoom ? context.appColors.gray4 : context.appColors.gray1,
              borderRadius: BorderRadius.circular(radius),
            ),
          );
        },
      ),
    );
  }
}