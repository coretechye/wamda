import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/reel_item.dart';
import '../../providers/reels_provider.dart';

/// الشريط العلوي لشاشة المقاطع (الفئات + وضع توفير البيانات + الإغلاق)
class ReelsTopBar extends StatelessWidget {
  final VoidCallback onClose;

  const ReelsTopBar({
    super.key,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ReelsProvider>();
    final isDataSaver = provider.dataSaverMode;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // السطر الأول: زر الرجوع + العنوان + زر وضع التوفير
            Row(
              children: [
                // زر الإغلاق / الرجوع
                GestureDetector(
                  onTap: onClose,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.35),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.15),
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // عنوان القسم
                const Expanded(
                  child: Text(
                    'ومضات',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(color: Colors.black87, blurRadius: 4),
                      ],
                    ),
                  ),
                ),

                // شارة الدقة 720p HD كحد أدنى
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2D5F3F).withOpacity(0.85),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFFD4AF37),
                      width: 1,
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.hd_rounded,
                        color: Color(0xFFD4AF37),
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Text(
                        '720p HD',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // السطر الثاني: شريط تصنيفات أفقي قابل للتمرير
            SizedBox(
              height: 32,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: ReelCategory.values.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final cat = ReelCategory.values[index];
                  final isSelected = provider.selectedCategory == cat;

                  return GestureDetector(
                    onTap: () => provider.setCategory(cat),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFD4AF37)
                            : Colors.black.withOpacity(0.35),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFFD4AF37)
                              : Colors.white.withOpacity(0.15),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            cat.icon,
                            size: 13,
                            color: isSelected ? Colors.black87 : Colors.white70,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            cat.titleAr,
                            style: TextStyle(
                              color: isSelected ? Colors.black87 : Colors.white,
                              fontSize: 12,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
