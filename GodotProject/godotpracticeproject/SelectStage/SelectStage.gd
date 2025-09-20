extends Control

@export var StageField: PackedScene

var _fileConv: StageFileConverter = StageFileConverter.new()
var _stageCount: int
var _stageFields: Array[Control]
var _selectedStageIndex: int = 2

func _ready() -> void:
	_stageCount = _fileConv.HowManyStage()
	print(_stageCount)
	for i in range(1, _stageCount + 1):
		var node: Control = StageField.instantiate()
		add_child(node)
		node.SetInfo("%d. %s" % [i, _fileConv.ReadStageFile(i).title], "기록 없음")
		_stageFields.append(node)
		
	RefreshStage()

func _process(delta: float) -> void:
	CheckInput()

func RefreshStage():
	_stageFields[_selectedStageIndex - 1].set_position(Vector2(200, 235))
	for i in range(0, _selectedStageIndex - 1):
		_stageFields[i].set_position(Vector2(200 - ((_selectedStageIndex - i - 1) * 20), 235 - ((_selectedStageIndex - i - 1) * 80)))
		_stageFields[i].modulate = Color.TRANSPARENT
	for i in range(_selectedStageIndex, _stageFields.size()):
		_stageFields[i].set_position(Vector2(200 + ((i - _selectedStageIndex + 1) * 20), 235 + ((i - _selectedStageIndex + 1) * 80)))
		_stageFields[i].modulate = Color.TRANSPARENT
	
	if _selectedStageIndex != 1:
		_stageFields[_selectedStageIndex - 2].modulate = Color(1, 1, 1, 0.2)
	_stageFields[_selectedStageIndex - 1].modulate = Color(1, 1, 1, 1)
	for i in range(_selectedStageIndex, min(_stageFields.size(), _selectedStageIndex + 3)):
		_stageFields[i].modulate = Color(1, 1, 1, 0.2)
		
func RefreshStageWithTweens():
	MovePosition(Vector2(200, 235), _stageFields[_selectedStageIndex - 1])
	for i in range(0, _selectedStageIndex - 1):
		MovePosition(Vector2(200 - ((_selectedStageIndex - i - 1) * 20), 235 - ((_selectedStageIndex - i - 1) * 80)), _stageFields[i])
		SetColor(Color.TRANSPARENT, _stageFields[i])
	for i in range(_selectedStageIndex, _stageFields.size()):
		MovePosition(Vector2(200 + ((i - _selectedStageIndex + 1) * 20), 235 + ((i - _selectedStageIndex + 1) * 80)), _stageFields[i])
		SetColor(Color.TRANSPARENT, _stageFields[i])
	
	if _selectedStageIndex != 1:
		SetColor(Color(1, 1, 1, 0.2), _stageFields[_selectedStageIndex - 2])
	SetColor(Color(1, 1, 1, 1), _stageFields[_selectedStageIndex - 1])
	for i in range(_selectedStageIndex, min(_stageFields.size(), _selectedStageIndex + 3)):
		SetColor(Color(1, 1, 1, 0.2), _stageFields[i])
#plus 20, 65

func MovePosition(pos: Vector2, obj: Control):
	var tween = get_tree().create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_SINE)
	tween.tween_property(obj, "position", pos, 0.2)

func SetColor(pColor: Color, obj: Control):
	var tween = get_tree().create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_SINE)
	tween.tween_property(obj, "modulate", pColor, 0.2)

func PlayerPressUpButton():
	if _selectedStageIndex != 1:
		_selectedStageIndex -= 1
		RefreshStageWithTweens()
	
func PlayerPressDownButton():
	if _selectedStageIndex != _stageCount:
		_selectedStageIndex += 1
		RefreshStageWithTweens()

func CheckInput():	
	if Input.is_action_just_pressed("finger_3"): PlayerPressUpButton()
	if Input.is_action_just_pressed("finger_4"): PlayerPressDownButton()
