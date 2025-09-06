extends Node2D

func Setup(pNotes: Array):
	var c: Color
	for i in range(0, 5):
		if pNotes[i]: c = Color(0, 0, 0)
		else: c = Color(1, 1, 1)
		get_child(i).self_modulate = c
