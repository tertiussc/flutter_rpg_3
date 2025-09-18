import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class StatsTable extends StatefulWidget {
  const StatsTable(this.character, {super.key});

  final Character character;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(16),
      child: Column(
        children: [
          // Available points
          Container(
            color: AppColors.secondaryColor,
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: widget.character.points > 0 ? Colors.amber : Colors.grey,
                ),
                SizedBox(width: 20),
                StyledText('Stat points available: '),
                Expanded(child: SizedBox(width: 20)),
                StyledHeading(widget.character.points.toString()),
              ],
            ),
          ),
          // Stats table
          Table(
              children: widget.character.statsAsList.map((stat) {
            return TableRow(
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor.withValues(alpha: 0.5),
                ),
                children: [
                  // stat title (e.g. health)
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StyledHeading(stat['title']!),
                    ),
                  ),

                  // stat value
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StyledHeading(stat['value']!),
                    ),
                  ),

                  // icon to increase stat
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: IconButton(
                      icon: Icon(Icons.arrow_upward, color: AppColors.textColor),
                      onPressed: () {
                        setState(() {
                          widget.character.increaseStat(stat['title']!);
                        });
                      },
                    ),
                  ),

                  // icon to decrease stat
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: GestureDetector(
                      child: Icon(Icons.arrow_downward, color: AppColors.textColor),
                      onTap: () {
                        setState(() {
                          widget.character.decreaseStat(stat['title']!);
                        });
                      },
                    ),
                  ),
                ]);
          }).toList()),
        ],
      ),
    );
  }
}
