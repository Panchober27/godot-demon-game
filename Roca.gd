extends RigidBody2D

export (int) var velocidad_min
export (int) var velocidad_max

var tipo_roca = ["roca", "roca2"]  ## Arreglos en GDScript.


#Primero selecciona el Spray y lo cambia al tipo de roca del arreglo.
#
#if $AnimatedSprite.animation == "roca2":
		#$CollisionShape2D.scale.x = 1.5
		#$CollisionShape2D.scale.y = 1.5
# Ese if cambia el tamaño del nodo de colision dependiendo el tamaño de la roca.
# usar solo si se ve necesario en la app.
#
func _ready():
	$AnimatedSprite.animation = tipo_roca[randi() % tipo_roca.size()]
	if $AnimatedSprite.animation == "roca2":
		$CollisionShape2D.scale.x = 1.5
		$CollisionShape2D.scale.y = 1.5


func _on_VisibilityNotifier2D_screen_exited():
	queue_free() #Si sale de la pantalla se elimina el personaje.





