extends Node2D

@export var FingerIn: Texture2D
@export var FingerOut: Texture2D

var _childs: Array

func _ready():
	for i in range(5):
		_childs.append(get_child(i))

func _process(delta: float):
	CheckInput()
	
func CheckInput():
	if Input.is_action_just_pressed("finger_1"): ColorChange(0, true)
	if Input.is_action_just_pressed("finger_2"): ColorChange(1, true)
	if Input.is_action_just_pressed("finger_3"): ColorChange(2, true)
	if Input.is_action_just_pressed("finger_4"): ColorChange(3, true)
	if Input.is_action_just_pressed("finger_5"): ColorChange(4, true)
	
	if Input.is_action_just_released("finger_1"): ColorChange(0, false)
	if Input.is_action_just_released("finger_2"): ColorChange(1, false)
	if Input.is_action_just_released("finger_3"): ColorChange(2, false)
	if Input.is_action_just_released("finger_4"): ColorChange(3, false)
	if Input.is_action_just_released("finger_5"): ColorChange(4, false)
	
func ColorChange(index: int, isKeyPressed: bool):
	if isKeyPressed: _childs[index].texture = FingerIn
	else: _childs[index].texture = FingerOut
	
