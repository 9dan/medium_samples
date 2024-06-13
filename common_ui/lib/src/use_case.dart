import 'package:flutter/material.dart';

class UseCase extends StatefulWidget {
  const UseCase({
    super.key,
    required this.title,
    required this.builder,
    this.loading = false,
  });

  final String title;
  final bool loading;
  final Widget Function(BuildContext) builder;

  @override
  State<UseCase> createState() => _UseCaseState();
}

class _UseCaseState extends State<UseCase> {
  bool _expanded = false;

  static const _animationDuration = Duration(milliseconds: 200);

  void _toggleExpanded() => setState(() => _expanded = !_expanded);

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(
              widget.title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: AnimatedRotation(
              turns: _expanded ? 0 : .5,
              duration: _animationDuration,
              child: const Icon(Icons.arrow_drop_up_rounded),
            ),
            onTap: _toggleExpanded,
          ),
          AnimatedCrossFade(
            firstChild: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: LinearProgressIndicator(
                minHeight: 8,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
            ),
            secondChild: const SizedBox(),
            crossFadeState: widget.loading
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: _animationDuration,
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox(),
            alignment: Alignment.topCenter,
            secondChild: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 500),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: widget.builder(context),
              ),
            ),
            crossFadeState: _expanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: _animationDuration,
          ),
        ],
      ),
    );
  }
}
