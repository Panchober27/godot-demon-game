extends CanvasLayer


signal iniciar_juego

func mostrar_mensaje(texto):
	$Mensaje.text = texto
	$Mensaje.show()
	$MensajeTimer.start()


func game_over():
	mostrar_mensaje("YOU LOOSE")
	yield($MensajeTimer, "timeout") #Lo que pase al siguente, espera a la señal del nodo
	$PLAYButton.show()
	$Mensaje.text = "DEMON RACE"
	$Mensaje.show()

func update_score(Puntos):
	$ScoreLabel.text = str(Puntos)
	



func _on_MensajeTimer_timeout():
	$Mensaje.hide()
	


#Cuando se presiona el boton PLAY
func _on_PLAYButton_pressed():
	$PLAYButton.hide()
	emit_signal("iniciar_juego")


