import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: VerticalScrollingView(),
    ),
  );
}

///Vertical Scroll View
class VerticalScrollingView extends StatefulWidget {
  const VerticalScrollingView({super.key});

  @override
  State<VerticalScrollingView> createState() => _VerticalScrollingViewState();
}

class _VerticalScrollingViewState extends State<VerticalScrollingView> {
  final List<FocusNode> _focusNodes = List.generate(25, (_) => FocusNode());

  ///shift position to current item

  void _scrollToPosition(int index) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final context = _focusNodes[index].context;
        if (context != null) {
          Scrollable.ensureVisible(
            context,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Vertical Scrolling")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: List.generate(
              25,
              (index) {
                return InkWell(
                  autofocus: index == 0 ? true : false,
                  focusColor: Colors.transparent,
                  focusNode: _focusNodes[index],
                  onFocusChange: (isFocused) {
                    if (isFocused) {
                      setState(() {});
                      _scrollToPosition(index);
                    }
                  },
                  onTap: () => print("Item $index tapped"),
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 200),
                    scale: _focusNodes[index].hasFocus ? 1.2 : 1,
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      height: 150,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: _focusNodes[index].hasFocus ? Colors.green : Colors.transparent,
                          width: 5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Item ${index + 1}',
                          style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

///Horizontal Scroll View
class HorizontalScrollingView extends StatefulWidget {
  const HorizontalScrollingView({super.key});

  @override
  State<HorizontalScrollingView> createState() => _HorizontalScrollingViewState();
}

class _HorizontalScrollingViewState extends State<HorizontalScrollingView> {
  final List<FocusNode> _focusNodes = List.generate(25, (_) => FocusNode());

  ///shift position to current item
  void _scrollToPosition(int index) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final context = _focusNodes[index].context;
        if (context != null) {
          Scrollable.ensureVisible(
            context,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Horizontal Scrolling")),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            25,
            (index) {
              return InkWell(
                autofocus: index == 0 ? true : false,
                focusColor: Colors.transparent,
                focusNode: _focusNodes[index],
                onFocusChange: (isFocused) {
                  if (isFocused) {
                    setState(() {});
                    _scrollToPosition(index);
                  }
                },
                onTap: () => print("Item $index tapped"),
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 200),
                  scale: _focusNodes[index].hasFocus ? 1.1 : 1,
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    height: 150,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: _focusNodes[index].hasFocus ? Colors.green : Colors.transparent,
                        width: 5,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Item ${index + 1}',
                        style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
