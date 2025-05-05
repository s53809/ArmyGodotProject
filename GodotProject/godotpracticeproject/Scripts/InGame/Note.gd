extends Node2D

#테스트용 임시 export, 일정 수준 이상의 구현이 끝난 후 export 코드 삭제 예정
@export var speed: float = 1.0
@export var startTime: float = -1.0 # -1.0일 경우 아직 startTime이 정해지지 않음을 의미
@export var NoteController: NoteControl

const START_YPOS: float = -345.0

func _physics_process(delta: float):
	if startTime == -1.0 or startTime >= NoteController.curTime:
		return
	
	position.y = START_YPOS + (NoteController.curTime - startTime) * speed;
