import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Selector {
  final int? rank;
  final int? expensive;
  final int? enrollement;
  const Selector({this.rank, this.enrollement, this.expensive});

  Selector copyWith({
    int? rank,
    int? expensive,
    int? enrollement,
  }) {
    return Selector(
      rank: rank ?? this.rank,
      expensive: expensive ?? this.expensive,
      enrollement: enrollement ?? this.enrollement,
    );
  }
}

class SelectorNotifier extends StateNotifier<Selector> {
  SelectorNotifier()
      : super(const Selector(rank: 1, enrollement: 1, expensive: 1));
  void updaterank(int value) {
    state = state.copyWith(
      rank: value,
    );
  }

  void updateexpensive(int value) {
    state = state.copyWith(
      expensive: value,
    );
  }

  void updateenrollement(int value) {
    state = state.copyWith(
      enrollement: value,
    );
  }
}

class CriteriaSelector extends StatefulWidget {
  final bool bc;
  const CriteriaSelector({Key? key,required this.bc}) : super(key: key);

  @override
  State<CriteriaSelector> createState() => _CriteriaSelectorState();
}

class _CriteriaSelectorState extends State<CriteriaSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: 
      widget.bc? Text("hello"): Text('dsjgk'),
    );
  }
}
