// bloc/habit_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_habits/models/habit.dart';

// Events
abstract class HabitEvent {}

class SetHabits extends HabitEvent {
  final List<Habit> habits;

  SetHabits(this.habits);
}

class UpdateHabit extends HabitEvent {
  final int id;
  final Habit habit;

  UpdateHabit(this.id, this.habit);
}

class DeleteHabit extends HabitEvent {
  final int id;

  DeleteHabit(this.id);
}

// States
class HabitState {
  final List<Habit> habits;

  HabitState(this.habits);
}

// BLoC
class HabitBloc extends Bloc<HabitEvent, HabitState> {
  HabitBloc() : super(HabitState([]));

  @override
  Stream<HabitState> mapEventToState(HabitEvent event) async* {
    if (event is SetHabits) {
      yield HabitState(event.habits);
    } else if (event is UpdateHabit) {
      List<Habit> updatedHabits = List.from(state.habits);
      final index = updatedHabits.indexWhere((habit) => habit.id == event.id);
      if (index != -1) {
        updatedHabits[index] = event.habit;
        yield HabitState(updatedHabits);
      }
    } else if (event is DeleteHabit) {
      List<Habit> updatedHabits = List.from(state.habits);
      updatedHabits.removeWhere((habit) => habit.id == event.id);
      yield HabitState(updatedHabits);
    }
  }
}
