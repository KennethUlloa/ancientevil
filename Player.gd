extends Area2D
export (int) var Velocidad = 400
var Movimiento = Vector2()
var limite
signal golpe
var num_golpes = 0

func _ready():
	hide()
	limite = get_viewport_rect().size


func _process(delta):
	Movimiento = Vector2()
	if Input.is_key_pressed(68):
		Movimiento.x += 1
	if Input.is_key_pressed(65):
		Movimiento.x -= 1
	if Input.is_key_pressed(87):
		Movimiento.y -= 1 
	if Input.is_key_pressed(83):
		Movimiento.y += 1
	if Movimiento.length() > 0:
		Movimiento = Movimiento.normalized() * Velocidad	
	position += Movimiento * delta
	
	position.x = clamp(position.x, 20, limite.x - 20)
	position.y = clamp(position.y, 20, limite.y - 20 )
	
	if Movimiento.x != 0:
		$AnimatedSprite.animation = "lado"
		$AnimatedSprite.flip_h = Movimiento.x < 0
	elif Movimiento.y < 0:
		$AnimatedSprite.animation = "atras"
	elif Movimiento.y > 0:
		$AnimatedSprite.animation = "frente"
	else: 
		$AnimatedSprite.animation = "quieto"


func _on_Player_body_entered(body):
	hide()
	#$CollisionShape2D.disabled = true
	$CollisionShape2D.set_deferred("disabled", true)
	num_golpes += 1 
	emit_signal("golpe")
	

func inicio(pos):
	position = pos
	show()
	#$CollisionShape2D.disabled = false
	$CollisionShape2D.set_deferred("disabled", false)
	
