extends CharacterBody2D

@export var WALK_SPEED = 250 # 걷기 속도 Inspector에서 조정 가능
@export var GRAVITY = 15 # 중력
@export var JUMP_POWER = 450 # 점프 강도

# 원래 sprite는 함수 내에서 초기화를 진행해줘야함
# 하지만 @onready 태그를 사용하면 변수 선언 시점에서 초기화 가능
# $ 키워드는 get_node()의 단축 표기임 $AnimatedSprited2D == get_node("AnimatedSprited2D")
# https://redpingdev.github.io/posts/sugar-gd-ko/
@onready var sprite = $AnimatedSprite2D
@onready var raycast2d = $RayCast2D

@onready var direction = Vector2(0, 0) # 이동방향

func _ready(): # unity의 Start()
	self.z_index = 100

func _physics_process(delta: float): # unity의 Update()
	if Input.is_action_pressed("ui_right"): # ui_right : 오른쪽 방향키
		direction.x = WALK_SPEED
		sprite.flip_h = false #AnimatedSprite2D -> Offset -> Flip H
		sprite.play("walk")
	elif Input.is_action_pressed("ui_left"):
		direction.x = -WALK_SPEED
		sprite.flip_h = true
		sprite.play("walk")
	else:
		direction.x = 0
		sprite.play("idle")
	
	direction.y += GRAVITY
	if raycast2d.is_colliding():
		direction.y = 0
		# is_action_pressed vs is_action_just_pressed
		# 누르고 있으면 true vs 누른 그 순간 한번만 true
		if Input.is_action_just_pressed("ui_up"):
			direction.y = -JUMP_POWER
			
	self.velocity = direction
	self.move_and_slide() # 만약 벽이나 다른 장애물과 충돌하면 벽에 붙어서 미끄러지도록 처리
	# move_and_collide() 벽이나 다른 장애물과 충돌하면 그자리에서 멈추도록 처리
			
	
