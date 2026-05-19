import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:my_app_module/models/floor_model.dart';
import 'package:my_app_module/models/room_model.dart';
import 'package:my_app_module/utils/build_context_extension.dart';
import 'package:my_app_module/utils/design/app_color_extension.dart';
import 'package:my_app_module/utils/design/app_spacing.dart';
import 'package:my_app_module/utils/design/app_text_styles.dart';
import 'package:my_app_module/viewmodels/floor/floor_viewmodel_provider.dart';
import 'package:my_app_module/widgets/app_image.dart';
import 'package:my_app_module/widgets/edit_floor_name_dialog.dart';

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
            padding: EdgeInsets.only(left: AppSpacing.pad16.w),
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
              error: (err, stack) => const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.pad16.w),
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

  Widget _buildFloorList(
    BuildContext context,
    List<FloorModel> floors,
    WidgetRef ref,
  ) {
    return ListView.builder(
      padding: EdgeInsets.only(top: AppSpacing.gap16.h),
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
        final floor = await ref
            .read(floorViewModelProvider.notifier)
            .createFloor(floorName);
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
      style: context.appTextStyles.bodyMediumWith60Opacity,
      textAlign: TextAlign.center,
    );
  }
}

class _FloorListItem extends ConsumerWidget {
  static const double _baseCellSize = 15.0;
  static const double _baseSpacing = 1.25;
  static const int _baseCols = 4;
  static const int _baseRows = 5;
  static const int _originalCols = 10;
  static const int _originalRows = 11;
  static const double _roomCellRadius = 2.0;

  final FloorModel floor;
  final VoidCallback? onTap;

  const _FloorListItem({required this.floor, this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Slidable(
      key: ValueKey(floor.id),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.25,
        children: [
          CustomSlidableAction(
            onPressed: (context) {
              ref.read(floorViewModelProvider.notifier).deleteFloor(floor.id);
            },
            backgroundColor: context.appColors.error6Normal,
            child: Center(
              child: Text(
                context.l10n.deleteFloor,
                style: context.appTextStyles.bodyMediumWith90Opacity.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
      child: Builder(
        builder: (newContext) => GestureDetector(
          onTap: () {
            Slidable.of(newContext)?.close();
            onTap?.call();
          },
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
                  Expanded(child: _buildFloorInfo(context, floor)),
                  SizedBox(width: AppSpacing.gap16.w),
                  _buildArrowIcon(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFloorInfo(BuildContext context, FloorModel floor) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildFloorNameRow(context, floor),
          _buildUpdateTime(context, floor),
          _buildRoomCountBadge(context, floor),
        ],
      ),
    );
  }

  Widget _buildFloorNameRow(BuildContext context, FloorModel floor) {
    return Row(
      children: [
        Text(
          floor.floorName,
          style: context.appTextStyles.bodyLargeWith90Opacity,
        ),
        SizedBox(width: AppSpacing.gap4.w),
        Text(
          '(${context.l10n.zonesCount(floor.rooms.length)})',
          style: context.appTextStyles.captionWith60Opacity,
        ),
      ],
    );
  }

  Widget _buildUpdateTime(BuildContext context, FloorModel floor) {
    final displayTime = floor.updatedAt ?? floor.createdAt;
    return Text(
      DateFormat('yyyy-MM-dd HH:mm').format(displayTime),
      style: context.appTextStyles.bodyMediumWith60Opacity,
    );
  }

  Widget _buildRoomCountBadge(BuildContext context, FloorModel floor) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.s10.w,
        vertical: AppSpacing.s3.h,
      ),
      decoration: BoxDecoration(
        color: context.appColors.gray1,
        borderRadius: BorderRadius.circular(AppSpacing.radius3.r),
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
            style: context.appTextStyles.bodyMediumWith60Opacity,
          ),
        ],
      ),
    );
  }

  Widget _buildArrowIcon(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: AppImage(
        'chevron_right.png',
        width: AppSpacing.gap24.w,
        height: AppSpacing.gap24.h,
        color: context.appColors.fontGy2with60Opacity,
      ),
    );
  }

  Widget _buildRoomsGrid(BuildContext context, List<RoomModel> rooms) {
    final gridSize = _GridSize(
      width: _baseCols * _baseCellSize + (_baseCols - 1) * _baseSpacing,
      height: _baseRows * _baseCellSize + (_baseRows - 1) * _baseSpacing,
    );

    final dimensions = _GridDimensions(cols: _baseCols, rows: _baseRows);
    final cellMetrics = _CellMetrics(
      cellSize: _baseCellSize,
      spacing: _baseSpacing,
    );

    if (rooms.isEmpty) {
      return _buildGridView(gridSize, dimensions, cellMetrics, {});
    }

    final roomLayout = _calculateRoomLayout(rooms);
    final newDimensions = _calculateNewGridDimensions(
      roomLayout.xRange,
      roomLayout.yRange,
    );
    final newCellMetrics = _calculateCellMetrics(gridSize, newDimensions);
    const lastFourColsStart = _originalCols - _baseCols;
    const lastFiveRowsStart = _originalRows - _baseRows;

    final isInLastRegion = roomLayout.minX >= lastFourColsStart &&
        roomLayout.maxX < _originalCols &&
        roomLayout.minY >= lastFiveRowsStart &&
        roomLayout.maxY < _originalRows;

    final roomIndicesInNewGrid = isInLastRegion
        ? _mapRoomIndicesToNewGrid(
            roomLayout.positions,
            lastFourColsStart,
            lastFiveRowsStart,
            _baseCols,
          )
        : _mapRoomIndicesToNewGrid(
            roomLayout.positions,
            roomLayout.minX,
            roomLayout.minY,
            newDimensions.cols,
          );

    return _buildGridView(
      gridSize,
      newDimensions,
      newCellMetrics,
      roomIndicesInNewGrid,
    );
  }

  _RoomLayout _calculateRoomLayout(List<RoomModel> rooms) {
    final positions = <Point<int>>{};
    int minX = _originalCols;
    int maxX = 0;
    int minY = _originalRows;
    int maxY = 0;

    for (final room in rooms) {
      final x = room.index % _originalCols;
      final y = room.index ~/ _originalCols;
      positions.add(Point(x, y));
      if (x < minX) minX = x;
      if (x > maxX) maxX = x;
      if (y < minY) minY = y;
      if (y > maxY) maxY = y;
    }

    return _RoomLayout(
      positions: positions,
      minX: minX,
      maxX: maxX,
      minY: minY,
      maxY: maxY,
      xRange: maxX - minX + 1,
      yRange: maxY - minY + 1,
    );
  }

  _GridDimensions _calculateNewGridDimensions(int xRange, int yRange) {
    const originalAspect = 10.0 / 11.0;
    int newCols = _baseCols;
    int newRows = _baseRows;

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

    return _GridDimensions(cols: newCols, rows: newRows);
  }

  _CellMetrics _calculateCellMetrics(
    _GridSize gridSize,
    _GridDimensions dimensions,
  ) {
    final cellWidth =
        (gridSize.width - (dimensions.cols - 1) * _baseSpacing) /
        dimensions.cols;
    final cellHeight =
        (gridSize.height - (dimensions.rows - 1) * _baseSpacing) /
        dimensions.rows;
    final cellSize = cellWidth < cellHeight ? cellWidth : cellHeight;
    final spacing = _baseSpacing * cellSize / _baseCellSize;

    return _CellMetrics(cellSize: cellSize, spacing: spacing);
  }

  Set<int> _mapRoomIndicesToNewGrid(
    Set<Point<int>> positions,
    int minX,
    int minY,
    int newCols,
  ) {
    final indices = <int>{};
    for (final pos in positions) {
      final newX = pos.x - minX;
      final newY = pos.y - minY;
      final newIndex = newY * newCols + newX;
      indices.add(newIndex);
    }
    return indices;
  }

  Widget _buildGridView(
    _GridSize gridSize,
    _GridDimensions dimensions,
    _CellMetrics cellMetrics,
    Set<int> roomIndices,
  ) {
    return SizedBox(
      width: gridSize.width.w,
      height: gridSize.height.h,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        clipBehavior: Clip.none,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: dimensions.cols,
          crossAxisSpacing: cellMetrics.spacing.w,
          mainAxisSpacing: cellMetrics.spacing.w,
          childAspectRatio: 1,
        ),
        itemCount: dimensions.cols * dimensions.rows,
        itemBuilder: (context, index) {
          final hasRoom = roomIndices.contains(index);
          return Container(
            decoration: BoxDecoration(
              color: hasRoom
                  ? context.appColors.gray4
                  : context.appColors.gray1,
              borderRadius: BorderRadius.circular(_roomCellRadius.r),
            ),
          );
        },
      ),
    );
  }
}

class _GridSize {
  final double width;
  final double height;

  const _GridSize({required this.width, required this.height});
}

class _RoomLayout {
  final Set<Point<int>> positions;
  final int minX;
  final int maxX;
  final int minY;
  final int maxY;
  final int xRange;
  final int yRange;

  const _RoomLayout({
    required this.positions,
    required this.minX,
    required this.maxX,
    required this.minY,
    required this.maxY,
    required this.xRange,
    required this.yRange,
  });
}

class _GridDimensions {
  final int cols;
  final int rows;

  const _GridDimensions({required this.cols, required this.rows});
}

class _CellMetrics {
  final double cellSize;
  final double spacing;

  const _CellMetrics({required this.cellSize, required this.spacing});
}
