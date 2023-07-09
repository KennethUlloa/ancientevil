extends CanvasLayer

signal iniciar_juego
signal Volume
signal helping

var h_on = false
var encendido = false

func mostrar_mensaje(texto):
	$Mensaje.text = texto
	$Mensaje.show()
	$MensajeTimer.start()
	 
func game_over():
	mostrar_mensaje("Game Over")
	yield($MensajeTimer, "timeout")
	$BotonPlay.show()
	$Mensaje.text = "Ancient Evil"
	$Mensaje.show()
	
func update_score(Puntos):
	$ScoreLabel.text = str(Puntos)
	


func _on_MensajeTimer_timeout():
	$Mensaje.hide()
	

func _on_BotonPlay_pressed():
	$BotonPlay.hide()
	emit_signal("iniciar_juego")


func _volumen(value):
	emit_signal("Volume")


func _on_VolButton_pressed():
	encendido = !encendido
	if encendido == true:
		$HSlider.show()
	else:
		$HSlider.hide()
	


func _on_help_pressed():
	h_on = !h_on
	if h_on == true:
		$helped.show()
	else:
		$helped.hide()
	
	emit_signal("helping")
	

		
