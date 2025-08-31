class_name MainGame

var _curStageInfo: StageInfo
var _playerInput = Array([], TYPE_BOOL, "", null)

var _curStep: int

# ---------- Subscribe -----------
func ClearEvent():
	print("Clear!")

func FailedEvent():
	print("Failed! Get back to first step")

# --------- Callback ---------
func PlayerKeyDown(num: int):
	_playerInput[num] = true
	if _playerInput[num] != _curStageInfo.notes[_curStep][num]:
		FailedEvent()
		
	
func PlayerKeyUp(num: int):
	_playerInput[num] = false
	
# ---------- MainGameFunc ---------
func Fail():
	_curStep = 0

# ---------- Flow ------------
func Start(pStageInfo: StageInfo):
	_curStageInfo = pStageInfo
	_curStep = 0

func Update():
	if _playerInput == _curStageInfo.notes[_curStep]:
		if _curStageInfo.notes.count <= _curStep:
			ClearEvent()
		else:
			_curStep += 1
	# _curStageInfo.notes[_curStep]
