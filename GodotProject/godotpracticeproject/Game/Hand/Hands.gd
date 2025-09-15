extends Node2D

var hand = preload("res://Game/Hand/hand.tscn")
var handArr = []

@export var _alphaStair: Array[float]
@export var _gameDriver: Node2D

func _enter_tree() -> void:
	_gameDriver.Standby.connect(GetStageInfo)
	_gameDriver.PrintStage.connect(PrintStage)
	
func GetStageInfo(value: StageInfo):
	_gameDriver.game.Clear.connect(Clear_Test)
	SetView(value.notes)

func MovePositionY(pos: float, obj: Node2D):
	var tween = get_tree().create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_SINE)
	tween.tween_property(obj, "position:y", pos, 0.2)

func SetAlpha(obj: Node2D, index: int) -> bool:
	if index >= _alphaStair.size():
		return false
	
	obj.modulate = Color(obj.modulate, _alphaStair[index])
	return true

func SetView(pNotes: Array):
	for i in range(pNotes.size()):
		handArr.append(hand.instantiate())
		add_child(handArr[i])
		handArr[i].position.y = 40 * i
		handArr[i].modulate = Color(handArr[i].modulate, 0)
		handArr[i].Setup(pNotes[i])
	
	handArr[0].modulate = Color(handArr[0].modulate, 1)

func PrintStage(value: int):
	for i in range(value):
		MovePositionY((40 * i) - (40 * value), handArr[i]);
		handArr[i].modulate = Color(handArr[i].modulate, 0)
		
	var countAlpha = 0
	for i in range(value, handArr.size()):
		MovePositionY((40 * i) - (40 * value), handArr[i]);
		if not SetAlpha(handArr[i], countAlpha): 
			handArr[i].modulate = Color(handArr[i].modulate, 0)
		countAlpha += 1

func Clear_Test():
	for i in range(handArr.size()):
		handArr[i].modulate = Color(handArr[i].modulate, 0)
