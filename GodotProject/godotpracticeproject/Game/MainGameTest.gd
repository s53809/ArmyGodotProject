extends Node2D

var stageInfo: StageInfo
var game: MainGame

signal Standby(pStageInfo: StageInfo)
signal GameStart()
signal PrintStage(value: int)

func _ready():
	var conv: StageFileConverter = StageFileConverter.new()
	stageInfo = conv.ReadStageFile(2)
	game = MainGame.new(stageInfo)
	game.Clear.connect(Clear)
	game.Fail.connect(Fail)
	game.Success.connect(Success)
	
	emit_signal("Standby", stageInfo)
func _process(delta: float):
	CheckInput()
	game.Update(delta)
	
	if !game._isStarted and game._playerInput[0] and game._playerInput[1] and game._playerInput[2] and game._playerInput[3] and game._playerInput[4]:
		game.Start()
		emit_signal("GameStart")
		PrintCurStage(0)
	
func CheckInput():
	if Input.is_action_just_pressed("finger_1"): game.PlayerKeyDown(0)
	if Input.is_action_just_pressed("finger_2"): game.PlayerKeyDown(1)
	if Input.is_action_just_pressed("finger_3"): game.PlayerKeyDown(2)
	if Input.is_action_just_pressed("finger_4"): game.PlayerKeyDown(3)
	if Input.is_action_just_pressed("finger_5"): game.PlayerKeyDown(4)
	
	if Input.is_action_just_released("finger_1"): game.PlayerKeyUp(0)
	if Input.is_action_just_released("finger_2"): game.PlayerKeyUp(1)
	if Input.is_action_just_released("finger_3"): game.PlayerKeyUp(2)
	if Input.is_action_just_released("finger_4"): game.PlayerKeyUp(3)
	if Input.is_action_just_released("finger_5"): game.PlayerKeyUp(4)

func Clear():
	print("당신은 클리어하다")
	
func Fail():
	print("당신은 실패하다")
	PrintCurStage(0)

func Success(value: int):
	PrintCurStage(value)
	
func PrintCurStage(value: int):
	emit_signal("PrintStage", value)

#todo: 키 입력도 플레이어가 할 수 있게 해줘야 한다.
#todo: 실제 게임 로직을 짤 땐, FSM으로 현재 시작 대기 상태인지, 게임진행상태인지, 종료상태인지 구분해야함
