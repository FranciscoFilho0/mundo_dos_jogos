import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/professor_controller.dart';
import '../../models/game_model.dart';
import '../../core/theme/app_theme.dart';

class ProfessorGamesView extends StatelessWidget {
  const ProfessorGamesView({super.key});

  @override
  Widget build(BuildContext context) {
    final prof = context.watch<ProfessorController>();
    final activeCount = prof.games.where((g) => g.isActive).length;

    return Scaffold(
      backgroundColor: AppTheme.profBackground,
      appBar: AppBar(title: const Text('Gerenciar Jogos')),
      body: Column(
        children: [
          // Info banner
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppTheme.profSecondary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppTheme.profSecondary.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                const Icon(Icons.info_outline, color: AppTheme.profSecondary, size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Ative ou desative jogos para controlar quais seus alunos podem acessar.',
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _StatusBadge(label: '$activeCount ativos', color: AppTheme.profSuccess),
                const SizedBox(width: 8),
                _StatusBadge(label: '${prof.games.length - activeCount} inativos', color: Colors.grey),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: prof.games.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, i) => _GameToggleCard(
                game: prof.games[i],
                onToggle: () => prof.toggleGameActive(prof.games[i].id),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String label;
  final Color color;
  const _StatusBadge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
      child: Text(label, style: TextStyle(color: color, fontWeight: FontWeight.w600, fontSize: 12)),
    );
  }
}

class _GameToggleCard extends StatelessWidget {
  final GameModel game;
  final VoidCallback onToggle;
  const _GameToggleCard({required this.game, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    final diffColor = game.difficulty == 'Fácil'
        ? AppTheme.profSuccess
        : game.difficulty == 'Médio'
            ? AppTheme.profWarning
            : AppTheme.profError;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: game.isActive ? 1.0 : 0.55,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 52, height: 52,
                decoration: BoxDecoration(
                  color: game.isActive
                      ? AppTheme.profPrimary.withOpacity(0.1)
                      : Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(child: Text(game.iconEmoji, style: const TextStyle(fontSize: 28))),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(game.title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                    const SizedBox(height: 3),
                    Text(game.subject, style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                          decoration: BoxDecoration(
                            color: diffColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(game.difficulty, style: TextStyle(fontSize: 11, color: diffColor, fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Switch(
                value: game.isActive,
                onChanged: (_) => onToggle(),
                activeColor: AppTheme.profPrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
