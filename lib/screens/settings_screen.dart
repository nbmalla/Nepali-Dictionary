import 'package:flutter/material.dart';
import '../state/app_settings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = AppSettings.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('設定')),
      body: AnimatedBuilder(
        animation: settings,
        builder: (context, _) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ListTile(
                title: const Text('UI言語'),
                subtitle: Text(settings.uiLanguage == UiLanguage.nepali ? 'नेपाली' : '日本語'),
                trailing: SegmentedButton<UiLanguage>(
                  segments: const [
                    ButtonSegment(value: UiLanguage.japanese, label: Text('JA')),
                    ButtonSegment(value: UiLanguage.nepali, label: Text('NE')),
                  ],
                  selected: {settings.uiLanguage},
                  onSelectionChanged: (s) => settings.setUiLanguage(s.first),
                ),
              ),
              const Divider(),
              ListTile(
                title: const Text('文字サイズ'),
                subtitle: Slider(
                  value: settings.fontScale,
                  min: 0.85,
                  max: 1.4,
                  divisions: 11,
                  label: '${(settings.fontScale * 100).round()}%',
                  onChanged: (v) => settings.setFontScale(v),
                ),
              ),
              const Divider(),
              ListTile(
                title: const Text('読み上げ速度'),
                subtitle: Slider(
                  value: settings.speechRate,
                  min: 0.25,
                  max: 0.7,
                  divisions: 9,
                  label: settings.speechRate <= 0.35
                      ? 'ゆっくり'
                      : settings.speechRate >= 0.55
                          ? '速い'
                          : '標準',
                  onChanged: (v) => settings.setSpeechRate(v),
                ),
              ),
              const Divider(),
              SwitchListTile(
                title: const Text('発音ボタンを常に表示'),
                value: settings.showSpeakerButtons,
                onChanged: (v) => settings.setShowSpeakerButtons(v),
              ),
            ],
          );
        },
      ),
    );
  }
}
