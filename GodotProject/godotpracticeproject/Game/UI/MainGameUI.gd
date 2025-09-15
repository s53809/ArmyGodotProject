extends Control

# -------- local --------
var _gameTitle : Label
var _remainTime : Label
var _description : Label
var _vBoxCon : Control

var _stageInfo: StageInfo
var _timer: float = 0: set = _PrintTime

var _isGameStarted: bool = false

# -------- MainGame ------

@export var _gameDriver: Node2D

# -------- method --------

func SetUI(title: String, desc: String = "아래 줄에 있는 상태로 손가락을 움직여보세요."):
	_gameTitle.text = title
	_description.text = desc
	_PrintTime(0)
	
func _PrintTime(time: float):
	_remainTime.text = "%.2fs" % time
	_timer = time

# --------- flow ------------
	
func _enter_tree() -> void:
	_gameDriver.Standby.connect(GetStageInfo)
	_vBoxCon = get_child(0).get_child(0)
	
	_gameTitle = _vBoxCon.get_child(1)
	_remainTime = _vBoxCon.get_child(2)
	_description = _vBoxCon.get_child(4)
	
func _process(delta: float) -> void:
	if !_isGameStarted: return
	_timer = _gameDriver.game.remainTime
	
# -------- event ----------
func GetStageInfo(pStageInfo: StageInfo):
	_stageInfo = pStageInfo
	_gameTitle.text = _stageInfo.title
	_description.text = "아래 줄에 있는 상태로 손가락을 움직여보세요."
	_timer = _stageInfo.limitTime
	
	_gameDriver.GameStart.connect(StartGame)
	_gameDriver.game.Clear.connect(Clear)
	_gameDriver.game.Fail.connect(Failed)
	
func StartGame():
	_description.text = "아래 줄에 있는 상태로 손가락을 움직여보세요."
	_isGameStarted = true

func Failed():
	_description.text = "실패하셨군요!"
	_isGameStarted = false
	_timer = _stageInfo.limitTime
	
func Clear():
	_isGameStarted = false
	# 임시 코드
	var ranks = "CBAS"
	for i in range(3):
		if _stageInfo.ranks[i] <= _timer:
			_description.text = "당신의 랭크는 %c 입니다!" % ranks[i + 1]
	if _stageInfo.ranks[0] > _timer:
		_description.text = "당신의 랭크는 %c 입니다!" % ranks[0]
