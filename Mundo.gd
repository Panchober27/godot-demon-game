extends Node

export (PackedScene) var Roca

var Score # Variable que almacena los puntos


func _ready():
		randomize()  #Cada patron se cambia aleatoriamente en cada inicio de la app.
	
	
#Funcion creada por mi mismo :)
func nuevo_juego():
	Score = 0
	$Player.inicio($PosicionDeInicio.position) #Posicion de inicio del Player
	$InicioTimer.start()
	$Interfaz.mostrar_mensaje("READY!")
	$Interfaz.update_score(Score)
	$AudioFondo.play()
	


func game_over():
	$ScoreTimer.stop() #Se detiene el timer.
	$RocaTimer.stop() #Se detiene la creacion de rocas.
	$Interfaz.game_over() #Activa el game_over de interfaz.
	$AudioFondo.stop() #Se corta la musica de fondo.
	$GameOver.play() #Se activa el sonido de game over.


func _on_InicioTimer_timeout():
	$ScoreTimer.start()
	$RocaTimer.start()




func _on_ScoreTimer_timeout():
	Score += 1
	$Interfaz.update_score(Score)
	


#Cuando se acabe el timer de la roca se hara esto:
func _on_RocaTimer_timeout():
	#Selecciona una posicion aleatoria del camino.
	$Camino/RocaPosicion.set_offset(randi())
	
	var R = Roca.instance()
	add_child(R)
	
	#Se le dara su direccion de posicion, rotacion, etc...
	var dir = $Camino/RocaPosicion.rotation + PI /2
	
	
	R.position = $Camino/RocaPosicion.position
	
	dir += rand_range(-PI /4, PI /4) #
	R.rotation = dir
	R.set_linear_velocity(Vector2(rand_range(R.velocidad_min, R.velocidad_max), 0).rotated(dir))




