@tool
extends Node2D

@export var FingerInAndOut: Array[Texture]

@export_group("Buttons")
@export var Finger1: bool = false: set = SetFinger1
@export var Finger2: bool = false: set = SetFinger2
@export var Finger3: bool = false: set = SetFinger3
@export var Finger4: bool = false: set = SetFinger4
@export var Finger5: bool = false: set = SetFinger5

func _ready() -> void: #so fucking ugly code
	get_child(5).texture = FingerInAndOut[int(Finger1)]
	get_child(2).texture = FingerInAndOut[int(Finger2)]
	get_child(6).texture = FingerInAndOut[int(Finger3)]
	get_child(3).texture = FingerInAndOut[int(Finger4)]
	get_child(4).texture = FingerInAndOut[int(Finger5)]

func SetFinger1(temp: bool):
	Finger1 = temp
	_ready()

func SetFinger2(temp: bool):
	Finger2 = temp
	_ready()

func SetFinger3(temp: bool):
	Finger3 = temp
	_ready()

func SetFinger4(temp: bool):
	Finger4 = temp
	_ready()

func SetFinger5(temp: bool):
	Finger5 = temp
	_ready()
