import 'package:flutter/material.dart';

class result_Screen extends StatelessWidget {
  final String name;
  final String gender; // 'male' or 'female'
  final double bmi;
  final int age;

  const result_Screen({
    super.key,
    required this.name,
    required this.gender,
    required this.bmi,
    required this.age,
  });

  // ── BMI Category Logic ─────────────────────────────────────────────────────
  String get _category {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25.0) return 'Normal';
    if (bmi < 30.0) return 'Overweight';
    return 'Obese';
  }

  Color get _categoryColor {
    if (bmi < 18.5) return const Color(0xFF54C5F8); // blue
    if (bmi < 25.0) return const Color(0xFF4CAF7D); // green
    if (bmi < 30.0) return const Color(0xFFFFB74D); // orange
    return const Color(0xFFEF5350);                  // red
  }

  String get _categoryMessage {
    if (bmi < 18.5) {
      return 'You are below the healthy weight range. Consider a nutritious diet.';
    } else if (bmi < 25.0) {
      return 'Great job! You are within the healthy weight range. Keep it up!';
    } else if (bmi < 30.0) {
      return 'You are slightly above the healthy range. Some lifestyle changes may help.';
    } else {
      return 'You are above the healthy weight range. Consult a healthcare professional.';
    }
  }

  IconData get _categoryIcon {
    if (bmi < 18.5) return Icons.trending_down_rounded;
    if (bmi < 25.0) return Icons.check_circle_outline_rounded;
    if (bmi < 30.0) return Icons.warning_amber_rounded;
    return Icons.error_outline_rounded;
  }

  // Gauge percentage: map BMI 10–40 → 0.0–1.0
  double get _gaugeValue => ((bmi - 10) / 30).clamp(0.0, 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1117),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Back Button ────────────────────────────────────────
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C1E26),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: const Color(0xFF2C2E3A), width: 1.5),
                  ),
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white70,
                    size: 20,
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // ── Title ──────────────────────────────────────────────
              const Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: -1.5,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Based on the information provided',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white38,
                  letterSpacing: 0.3,
                ),
              ),

              const SizedBox(height: 32),

              // ── Profile Card ───────────────────────────────────────
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1E26),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: const Color(0xFF2C2E3A), width: 1.5),
                ),
                child: Row(
                  children: [
                    // Avatar circle
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: const Color(0xFF6C63FF).withOpacity(0.15),
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: const Color(0xFF6C63FF), width: 2),
                      ),
                      child: Icon(
                        gender == 'male'
                            ? Icons.male_rounded
                            : Icons.female_rounded,
                        color: const Color(0xFF6C63FF),
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${gender[0].toUpperCase()}${gender.substring(1)} · $age years old',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white38,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ── BMI Score Card ─────────────────────────────────────
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: _categoryColor.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                      color: _categoryColor.withOpacity(0.3), width: 1.5),
                ),
                child: Column(
                  children: [
                    // Category badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        color: _categoryColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: _categoryColor.withOpacity(0.4),
                            width: 1),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(_categoryIcon,
                              color: _categoryColor, size: 16),
                          const SizedBox(width: 6),
                          Text(
                            _category.toUpperCase(),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: _categoryColor,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // BMI number
                    Text(
                      bmi.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.w900,
                        color: _categoryColor,
                        letterSpacing: -3,
                        height: 1,
                      ),
                    ),
                    const Text(
                      'kg/m²',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white38,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Gauge bar
                    _BmiGaugeBar(value: _gaugeValue, color: _categoryColor),

                    const SizedBox(height: 20),

                    // Message
                    Text(
                      _categoryMessage,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white54,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ── BMI Range Reference ────────────────────────────────
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1E26),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: const Color(0xFF2C2E3A), width: 1.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'BMI RANGES',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Colors.white38,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 14),
                    _RangeRow(
                        label: 'Underweight',
                        range: '< 18.5',
                        color: const Color(0xFF54C5F8),
                        isActive: bmi < 18.5),
                    _RangeRow(
                        label: 'Normal',
                        range: '18.5 – 24.9',
                        color: const Color(0xFF4CAF7D),
                        isActive: bmi >= 18.5 && bmi < 25),
                    _RangeRow(
                        label: 'Overweight',
                        range: '25 – 29.9',
                        color: const Color(0xFFFFB74D),
                        isActive: bmi >= 25 && bmi < 30),
                    _RangeRow(
                        label: 'Obese',
                        range: '≥ 30',
                        color: const Color(0xFFEF5350),
                        isActive: bmi >= 30,
                        isLast: true),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // ── Recalculate Button ─────────────────────────────────
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6C63FF),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.refresh_rounded, size: 20),
                      SizedBox(width: 10),
                      Text(
                        'RECALCULATE',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── BMI Gauge Bar ─────────────────────────────────────────────────────────────

class _BmiGaugeBar extends StatelessWidget {
  final double value; // 0.0 – 1.0
  final Color color;

  const _BmiGaugeBar({required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              // Background track with gradient segments
              Container(
                height: 10,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF54C5F8),
                      Color(0xFF4CAF7D),
                      Color(0xFFFFB74D),
                      Color(0xFFEF5350),
                    ],
                  ),
                ),
              ),
              // Dark overlay for unvisited portion
              Align(
                alignment: Alignment.centerRight,
                child: FractionallySizedBox(
                  widthFactor: 1 - value,
                  child: Container(
                    height: 10,
                    color: const Color(0xFF0F1117).withOpacity(0.6),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        // Pointer position
        LayoutBuilder(
          builder: (context, constraints) {
            final double indicatorX =
                value * constraints.maxWidth - 6;
            return Stack(
              children: [
                SizedBox(height: 16, width: constraints.maxWidth),
                Positioned(
                  left: indicatorX.clamp(0.0, constraints.maxWidth - 12),
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: color.withOpacity(0.5),
                          blurRadius: 6,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

// ─── Range Row ─────────────────────────────────────────────────────────────────

class _RangeRow extends StatelessWidget {
  final String label;
  final String range;
  final Color color;
  final bool isActive;
  final bool isLast;

  const _RangeRow({
    required this.label,
    required this.range,
    required this.color,
    required this.isActive,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(
            bottom: BorderSide(color: Color(0xFF2C2E3A), width: 1)),
      ),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight:
                isActive ? FontWeight.w700 : FontWeight.w400,
                color: isActive ? Colors.white : Colors.white54,
              ),
            ),
          ),
          Text(
            range,
            style: TextStyle(
              fontSize: 13,
              fontWeight:
              isActive ? FontWeight.w700 : FontWeight.w400,
              color: isActive ? color : Colors.white38,
            ),
          ),
          if (isActive) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'YOU',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  color: color,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
