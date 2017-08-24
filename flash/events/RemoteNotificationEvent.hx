package flash.events;

extern class RemoteNotificationEvent extends Event {
	var data(default,null) : Dynamic;
	var tokenId(default,null) : String;
	function new(type : String, bubbles : Bool=false, cancelable : Bool=false, ?data : Dynamic, ?tokenId : String) : Void;
	static var NOTIFICATION : String;
	static var TOKEN : String;
}
