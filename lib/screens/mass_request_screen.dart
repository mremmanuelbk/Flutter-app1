import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/locale_provider.dart';
import '../l10n/app_strings.dart';
import '../models/mass_request.dart';
import '../services/telegram_service.dart';
import '../theme/app_theme.dart';

class MassRequestScreen extends StatefulWidget {
  const MassRequestScreen({super.key});

  @override
  State<MassRequestScreen> createState() => _MassRequestScreenState();
}

class _MassRequestScreenState extends State<MassRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  final _requesterCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _personCtrl = TextEditingController();
  final _messageCtrl = TextEditingController();
  String _intentionType = 'Défunt';
  DateTime? _preferredDate;
  bool _sending = false;

  static const _intentionTypes = [
    'Défunt',
    'Action de grâce',
    'Guérison',
    'Vocation',
    'Autre',
  ];

  @override
  void dispose() {
    _requesterCtrl.dispose();
    _phoneCtrl.dispose();
    _personCtrl.dispose();
    _messageCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit(AppStrings s) async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _sending = true);

    final request = MassRequest(
      intentionType: _intentionType,
      requesterName: _requesterCtrl.text.trim(),
      phone: _phoneCtrl.text.trim(),
      personName: _personCtrl.text.trim(),
      preferredDate: _preferredDate,
      message: _messageCtrl.text.trim(),
    );

    final ok = await TelegramService.sendMessage(request.toTelegramText());

    if (!mounted) return;
    setState(() => _sending = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(ok ? s.t('sentSuccess') : s.t('sendError'))),
    );
    if (ok) {
      _formKey.currentState!.reset();
      _requesterCtrl.clear();
      _phoneCtrl.clear();
      _personCtrl.clear();
      _messageCtrl.clear();
      setState(() => _preferredDate = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = AppStrings(context.watch<LocaleProvider>().code);
    return Scaffold(
      appBar: AppBar(title: Text(s.t('massRequest'))),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(s.t('intentionType'), style: const TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            DropdownButtonFormField<String>(
              value: _intentionType,
              items: _intentionTypes
                  .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                  .toList(),
              onChanged: (v) => setState(() => _intentionType = v ?? _intentionType),
            ),
            const SizedBox(height: 16),
            _Field(label: s.t('requesterName'), controller: _requesterCtrl, s: s),
            const SizedBox(height: 16),
            _Field(label: s.t('phone'), controller: _phoneCtrl, s: s, keyboardType: TextInputType.phone),
            const SizedBox(height: 16),
            _Field(label: s.t('personName'), controller: _personCtrl, s: s),
            const SizedBox(height: 16),
            Text(s.t('preferredDate'), style: const TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            InkWell(
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                  initialDate: DateTime.now(),
                );
                if (picked != null) setState(() => _preferredDate = picked);
              },
              child: InputDecorator(
                decoration: const InputDecoration(),
                child: Text(_preferredDate == null
                    ? "Choisir une date"
                    : '${_preferredDate!.day}/${_preferredDate!.month}/${_preferredDate!.year}'),
              ),
            ),
            const SizedBox(height: 16),
            Text(s.t('message'), style: const TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            TextFormField(
              controller: _messageCtrl,
              maxLines: 3,
              decoration: const InputDecoration(hintText: 'Votre intention...'),
            ),
            const SizedBox(height: 26),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _sending ? null : () => _submit(s),
                child: _sending
                    ? const SizedBox(
                        height: 18, width: 18,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                    : Text(s.t('sendRequest')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final AppStrings s;
  final TextInputType? keyboardType;

  const _Field({required this.label, required this.controller, required this.s, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: (v) => (v == null || v.trim().isEmpty) ? s.t('required') : null,
          decoration: InputDecoration(hintText: label),
        ),
      ],
    );
  }
}
