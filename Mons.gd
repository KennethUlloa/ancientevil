extends RigidBody2D

export (int) var vel_min
export (int) var vel_max
var tipo_monstruo = ["mons","mini"]

func _ready():
	$AnimatedSprite.animation = tipo_monstruo[randi() % tipo_monstruo.size()]
	if $AnimatedSprite.animation == "mons":
		$CollisionShape2D.scale.x = 1.8
		$CollisionShape2D.scale.y = 1.8
		
		
	


func _on_Visibilidad_screen_exited():
	queue_free()


	
