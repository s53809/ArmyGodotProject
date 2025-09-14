extends Control

var _gameTitle : Label
var _remainTime : Label
var _description : Label

var _vBoxCon : Control

var _timer: float = 0
var _isTimerStarted: bool = false

# -------- public method --------

func SetUI(title: String, desc: String = "아래 줄에 있는 상태로 손가락을 움직여보세요."):
	_gameTitle.text = title
	_description.text = desc
	PrintTime(0)
	
func PrintTime(time: float):
	_remainTime.text = "%.2fs" % time

# --------- flow ------------
	
func _ready() -> void:
	_vBoxCon = get_child(0).get_child(0)
	
	_gameTitle = _vBoxCon.get_child(1)
	_remainTime = _vBoxCon.get_child(2)
	_description = _vBoxCon.get_child(4)

func _process(delta: float) -> void:
	if !_isTimerStarted: return
	_timer += delta
	PrintTime(_timer)
	
# -------- event ----------
func StartGame():
	_isTimerStarted = true
	_timer = 0
	_description.text = "아래 줄에 있는 상태로 손가락을 움직여보세요."

func Failed():
	_isTimerStarted = false
	_timer = 0
	_description.text = "실패하셨군요!"
	
func Clear():
	_isTimerStarted = false
