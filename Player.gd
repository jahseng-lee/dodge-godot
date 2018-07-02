extends Area2D

export (int) var speed
var screensize
var player

func _ready():
	screensize = get_viewport_rect().size
	player = get_node(".")
	set_process(true)

func _process(delta):
	var velocity = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		get_node("AnimatedSprite").play()
	else:
		get_node("AnimatedSprite").stop()

	var player_pos = player.get_pos() + velocity * delta
	
	# clamp to stop player heading out of bounds
	player.set_pos(Vector2(clamp(player_pos.x, 0, screensize.x), clamp(player_pos.y, 0, screensize.y)))