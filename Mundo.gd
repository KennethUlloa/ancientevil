extends Node

export (PackedScene) var Mons
var Score

func _ready():
	randomize()
	$Interfaz/HSlider.hide()
	$Interfaz/helped.hide()
	$Musica.volume_db = -20
	$Game_Over.volume_db = -20

func nuevo_juego():
	Score = 0
	$Player.inicio($PosicionInicio.position)
	$InicioTimer.start()
	$Interfaz.mostrar_mensaje("Preparate!")
	$Interfaz.update_score(Score)
	$Interfaz/Panel.hide()
	$Interfaz/helped.hide()
	#$Interfaz/HSlider.hide()
	
	$Musica.play()
	

func game_over():
	$ScoreTimer.stop()
	$MonsTimer.stop()
	$Interfaz.game_over()
	$Musica.stop()
	$Interfaz/Panel.show()
	$Game_Over.play()
	
	


func _on_InicioTimer_timeout():
	$MonsTimer.start()
	$ScoreTimer.start()


func _on_ScoreTimer_timeout():
	Score += 1
	$Interfaz.update_score(Score)
	
	


func _on_MonsTimer_timeout():
	$Camino/MonsPos.set_offset(randi())
	
	var M = Mons.instance()
	add_child(M)
	
	var vel = 200
	
	if Score % 50 == 0 && Score > 0:
		M.vel_min += 20
		M.vel_max += 20
		vel += 50
		
	var d = $Camino/MonsPos.rotation
	
	M.position = $Camino/MonsPos.position
	
	
	d += rand_range(-PI/4 , PI/4)
	M.rotation = d
	
	#M.set_linear_velocity(Vector2(rand_range(M.vel_min,M.vel_max),200).rotated(d)) 
	M.set_linear_velocity(Vector2(rand_range(M.vel_min,M.vel_max),vel).rotated(d)) 
	

func _on_Interfaz_Volume():
	
	$Musica.volume_db = $Interfaz/HSlider.value
	$Game_Over.volume_db = $Interfaz/HSlider.value


func _on_Interfaz_helping():
	pass



