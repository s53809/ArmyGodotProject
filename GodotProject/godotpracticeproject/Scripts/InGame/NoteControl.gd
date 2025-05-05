class_name NoteControl extends Node

var noteSpeed: float = 1.0
var curTime: float = 0.0

func _physics_process(delta: float):
	curTime += delta
