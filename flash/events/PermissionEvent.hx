package flash.events;

/**
 * ...
 * @author P.J.Shand
 */
@:require(AIR24)
extern class PermissionEvent extends Event
{
	public static inline var PERMISSION_STATUS:String = "permissionStatus";
	var status(default, null) : String;
	function new(type : String, bubbles : Bool=false, cancelable : Bool=false, status:String = "denied") : Void;
}
