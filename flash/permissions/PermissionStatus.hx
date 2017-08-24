package flash.permissions;

/**
 * ...
 * @author P.J.Shand
 */
@:require(AIR24)
@:enum
abstract PermissionStatus(String) to String
{
    var DENIED = "denied";
    var GRANTED = "granted";
    var UNKNOWN = "unknown";
}