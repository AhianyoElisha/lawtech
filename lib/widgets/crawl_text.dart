import 'package:flutter/material.dart';

class TextCrawl extends StatefulWidget {
  final String text;
  final double speed;

  const TextCrawl({Key? key, required this.text, required this.speed}) : super(key: key);

  @override
  _TextCrawlState createState() => _TextCrawlState();
}

class _TextCrawlState extends State<TextCrawl> with SingleTickerProviderStateMixin {
  ScrollController? _scrollController;
  late double _scrollPosition;
  late double _textWidth;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startScrolling());
  }

  void _startScrolling() {
    _scrollPosition = _scrollController!.position.maxScrollExtent;
    _scrollController!.animateTo(
      _scrollPosition,
      duration: Duration(seconds: (_textWidth / widget.speed).round()),
      curve: Curves.linear,
    ).then((value) {
      _scrollController!.jumpTo(0.0);
      _startScrolling();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final textSize = _calculateTextSize(widget.text, Theme.of(context).textTheme.bodySmall!);
    _textWidth = textSize.width;
  }

  Size _calculateTextSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.size;
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0, // Adjust the height as needed
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        child: Text(
          widget.text,
          style: const TextStyle(fontSize: 16.0, color: Colors.white), // Adjust the font size as needed
        ),
      ),
    );
  }
}