extends Control

# -------- local --------
var _gameTitle : Label
var _remainTime : Label
var _description : Label

var _vBoxCon : Control

var _timer: float = 0: set = _PrintTime

# -------- MainGame ------

@export var _gameDriver: Node2D

# -------- method --------

func SetUI(title: String, desc: String = "아래 줄에 있는 상태로 손가락을 움직여보세요."):
	_gameTitle.text = title
	_description.text = desc
	_PrintTime(0)
	
func _PrintTime(time: float):
	_remainTime.text = "%.2fs" % time

# --------- flow ------------
	
func _ready() -> void:
	_vBoxCon = get_child(0).get_child(0)
	
	_gameTitle = _vBoxCon.get_child(1)
	_remainTime = _vBoxCon.get_child(2)
	_description = _vBoxCon.get_child(4)
	
# -------- event ----------
func StartGame():
	_description.text = "아래 줄에 있는 상태로 손가락을 움직여보세요."

func Failed():
	_description.text = "실패하셨군요!"
	
func Clear():
	_description.text = "Hello!"
