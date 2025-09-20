extends Control

@export var StageField: PackedScene

var _fileConv: StageFileConverter = StageFileConverter.new()
var _stageCount: int
var _stageFields: Array[Control]
var _selectedStageIndex: int = 1

func _ready() -> void:
	_stageCount = _fileConv.HowManyStage()
	print(_stageCount)
	for i in range(1, _stageCount + 1):
		var node: Control = StageField.instantiate()
		add_child(node)
		node.SetInfo(_fileConv.ReadStageFile(i).title, "기록 구현 안되었음")
		# node.set_position(Vector2(200 + ((i - 1) * 20), 235 + ((i - 1) * 80)))
		#todo : 스테이지 목록 위치 재조정하는 함수 만들기
		_stageFields.append(node)

func _process(delta: float) -> void:
	CheckInput()
	
#plus 20, 65

func MovePosition(pos: Vector2, obj: Control):
	var tween = get_tree().create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_SINE)
	tween.tween_property(obj, "position", pos, 0.2)

func PlayerPressUpButton():
	return
	
func PlayerPressDownButton():
	return

func CheckInput():	
	if Input.is_action_just_pressed("finger_1"): PlayerPressUpButton()
	if Input.is_action_just_pressed("finger_2"): PlayerPressDownButton()
