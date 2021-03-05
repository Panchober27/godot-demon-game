extends Area2D

export (int) var Velocidad
var Movimiento = Vector2() ## Se repite esta variable mas abajo.
var limite
signal golpe   #Avisa cuando el personaje es derribado x el enemigo.



# Called when the node enters the scene tree for the first time.
func _ready():
		hide() #Esconde al personaje al inicio del juego.
		limite = get_viewport_rect().size
		#pass 


func _process(delta):
	
	Movimiento = Vector2()
	
	if Input.is_action_pressed("ui_right"):#Derecha
		Movimiento.x += 1
	if Input.is_action_pressed("ui_left"):#Izquierda
		Movimiento.x -= 1
	if Input.is_action_pressed("ui_down"):#Abajo
		Movimiento.y += 1
	if Input.is_action_pressed("ui_up"):#Arriba
		Movimiento.y -=1
	if Movimiento.length() > 0: # Verifica si esta movimiendo
		Movimiento = Movimiento.normalized() * Velocidad#Normaliza la velocidad
	position += Movimiento * delta # Regla de velocidad universal independiente del hardware.
	position.x = clamp(position.x, 0, limite.x)#Limite de movimiento.
	position.y = clamp(position.y, 0, limite.y)#Limite de movimiento.
	
	
	# EN GGScript para subir es y -=
	# y para bajar es y +=
	# Es alrevez del mundo.
	
	if Movimiento.x != 0: # si se mueve
		$Sprite_player.animation = "Walk"
		#$Sprite_player.flip_h = Movimiento.x < 0 #Queda la CAGA con el CollisionShape2D (se  va pal lao la wea!)
	elif Movimiento.y !=0:
		$Sprite_player.animation = "Walk"
		#$Sprite_player.flip_v = Movimiento.y > 0
	# Logica para la muerte
	elif $CollisionShape2D.is_processing():
		$Sprite_player.animation = "Death" 
	else:
		$Sprite_player.animation = "Front"

## En esta funcion para la colision intentar meter la animacion de muerte antes
## de que el personaje desaparesca!

func _on_Player_body_entered(body): #Cuando haya una colision con un cuerpo.
	#$Sprite_player.animation = "Death"
	# esto es para aplicar la animacion de la muerte cuando
	# se instancie game over.
	#
	#hide()
	emit_signal("golpe")
	$CollisionShape2D.disabled = true

func inicio(pos): #pos viene desde Mundo.gd
	position = pos
	show() ## Vuelve a mostrar al personaje.
	$CollisionShape2D.disabled = false
	
	
	

