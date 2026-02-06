extends Resource
class_name CreatureType

##The maximum speed (per second) the vehicle can travel at
@export var max_speed:float = 500
##The max amount (per second) the vehicle can apply a force to it's velocity
@export var force:float = 1000
##The behaviours factored in every frame
@export var behaviours:Array[Behaviour]
##The groups this creature will be added to
@export var groups:Array[StringName]
