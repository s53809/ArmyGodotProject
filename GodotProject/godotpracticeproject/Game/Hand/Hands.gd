extends Node2D

var hand = preload("res://Game/Hand/hand.tscn")
var handArr = []

func SetView(pNotes: Array):
	for i in range(pNotes.size()):
		handArr.append(hand.instantiate())
		add_child(handArr[i])
		handArr[i].position.y = 40 * i
		handArr[i].Setup(pNotes[i])

func PrintStage(value: int):
	for i in range(value):
		handArr[i].position.y = (40 * i) - (40 * value)
		handArr[i].modulate = Color(handArr[i].modulate, 0)
		
	for i in range(value, handArr.size()):
		handArr[i].position.y = (40 * i) - (40 * value)
		handArr[i].modulate = Color(handArr[i].modulate, 1)

func Clear_Test():
	for i in range(handArr.size()):
		handArr[i].modulate = Color(handArr[i].modulate, 0)
