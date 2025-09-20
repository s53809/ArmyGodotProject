extends VBoxContainer

var _title: Label
var _record: Label

func _enter_tree() -> void:
	_title = get_child(0)
	_record = get_child(1)

func SetInfo(title: String, record: String):
	_title.text = title
	_record.text = record
