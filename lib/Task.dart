class Task {
  String _name;
  bool _completed;
  Task(
      String _name
      ) : _name = _name;

  getName() => this._name;
  setName(name) => this._name = name;

  isCompleted() => (this._completed == null)?false: this._completed;
  setCompleted(completed) => this._completed = completed;
}