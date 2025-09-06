extends Node2D

@export var FingerIn: Texture2D
@export var FingerOut: Texture2D

func Setup(pNotes: Array):
	for i in range(0, 5):
		if pNotes[i]: get_child(i).texture = FingerIn
		else: get_child(i).texture = FingerOut
