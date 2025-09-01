class_name MainGame

var _curStageInfo: StageInfo
var _playerInput = Array([], TYPE_BOOL, "", null)

var _curStep: int

var _isStarted: bool

# MainGame 객체가 생성되면 해야할 것
# Clear, Fail, Success 이벤트 구독하기
# 입력 함수 호출시키기
# Update 함수 매 프레임마다 호출

# ---------- Constructor ---------
func _init(pStageInfo: StageInfo):
	_curStageInfo = pStageInfo
	_curStep = 0
	_playerInput = [false, false, false, false, false]
	_isStarted = false

# ---------- Subscribe -----------
signal Clear()
signal Fail()
signal Success(nextStep: int)

# --------- Callback ---------
func PlayerKeyDown(num: int):
	_playerInput[num] = true
	if !_isStarted: return
	if _playerInput[num] != _curStageInfo.notes[_curStep][num]:
		FailedEvent()
	
func PlayerKeyUp(num: int):
	_playerInput[num] = false
	
# ---------- MainGameFunc ---------
func ClearEvent():
	if !_isStarted: return
	emit_signal("Clear")
	_isStarted = false

func FailedEvent():
	if !_isStarted: return
	_curStep = 0
	emit_signal("Fail")
	_isStarted = false
	
func SuccessEvent():
	if !_isStarted: return
	_curStep += 1
	emit_signal("Success", _curStep)

# ---------- Flow ------------
func Start():
	_isStarted = true

func Update():
	if !_isStarted: return
	if _playerInput == _curStageInfo.notes[_curStep]:
		if _curStageInfo.notes.size() <= _curStep + 1:
			ClearEvent()
		else:
			SuccessEvent()
