package air;

#if macro
	import haxe.macro.Context;
	import haxe.macro.Expr;
	import haxe.macro.Expr.ExprOf;
	import haxe.macro.Expr.Position;
	import haxe.macro.ExprTools;
#else
	@:build(air.AirMacro.init())
	class AirMacroBuild { }
#end
/**
 * ...
 * @author P.J.Shand
 */


#if macro
class AirMacro
{
	static public function init()
	{
		var args:Array<String> = Sys.args();
		var swfVersion:Null<Int> = null;
		var i:Int = 0;
		for (i in 0...args.length) 
		{
			if (args[i] == '-swf-version') {
				if (i < args.length -1) {
					swfVersion = Std.parseInt(args[i + 1]);
					
				}
			}
		}
		//trace(swfVersion);
		if (swfVersion == null) {
			Context.error("-swf-version not defined", Context.currentPos());
		}
		else {
			
			var versionMap = new Array<VersionMapObject>();
			versionMap.push( { swfVersion:9, flashVersion:9.1, airVersion:1 } );
			versionMap.push( { swfVersion:10, flashVersion:10, airVersion:1.5 } );
			versionMap.push( { swfVersion:10, flashVersion:10.1, airVersion:2 } );
			versionMap.push( { swfVersion:11, flashVersion:10.2, airVersion:2.6 } );
			versionMap.push( { swfVersion:12, flashVersion:10.3, airVersion:2.7 } );
			versionMap.push( { swfVersion:13, flashVersion:11, airVersion:3 } );
			versionMap.push( { swfVersion:14, flashVersion:11.1, airVersion:3.1 } );
			versionMap.push( { swfVersion:15, flashVersion:11.2, airVersion:3.2 } );
			versionMap.push( { swfVersion:16, flashVersion:11.3, airVersion:3.3 } );
			versionMap.push( { swfVersion:17, flashVersion:11.4, airVersion:3.4 } );
			versionMap.push( { swfVersion:18, flashVersion:11.5, airVersion:3.5 } );
			versionMap.push( { swfVersion:19, flashVersion:11.6, airVersion:3.6 } );
			versionMap.push( { swfVersion:20, flashVersion:11.7, airVersion:3.7 } );
			versionMap.push( { swfVersion:21, flashVersion:11.8, airVersion:3.8 } );
			versionMap.push( { swfVersion:22, flashVersion:11.9, airVersion:3.9 } );
			versionMap.push( { swfVersion:23, flashVersion:12, airVersion:4 } );
			versionMap.push( { swfVersion:24, flashVersion:13, airVersion:13 } );
			versionMap.push( { swfVersion:25, flashVersion:14, airVersion:14 } );
			versionMap.push( { swfVersion:26, flashVersion:15, airVersion:15 } );
			versionMap.push( { swfVersion:27, flashVersion:16, airVersion:16 } );
			versionMap.push( { swfVersion:28, flashVersion:17, airVersion:17 } );
			versionMap.push( { swfVersion:29, flashVersion:18, airVersion:18 } );
			versionMap.push( { swfVersion:30, flashVersion:19, airVersion:19 } );
			versionMap.push( { swfVersion:31, flashVersion:20, airVersion:20 } );
			versionMap.push( { swfVersion:32, flashVersion:21, airVersion:21 } );
			versionMap.push( { swfVersion:33, flashVersion:22, airVersion:22 } );
			versionMap.push( { swfVersion:34, flashVersion:23, airVersion:23 } );
			versionMap.push( { swfVersion:35, flashVersion:24, airVersion:24 } );
			versionMap.push( { swfVersion:36, flashVersion:25, airVersion:25 } );
			versionMap.push( { swfVersion:37, flashVersion:26, airVersion:26 } );
			versionMap.push( { swfVersion:38, flashVersion:27, airVersion:27 } );
			versionMap.push( { swfVersion:39, flashVersion:28, airVersion:28 } );
			for (i in 0...30) 
			{
				versionMap.push( { swfVersion:40 + i, flashVersion:29 + i, airVersion:29 + i } );
			}
			
			var j:Int = versionMap.length - 1;
			//var airFlags:Array<String> = [];
			var matchFount:Bool = false;
			while (j >= 0) 
			{
				//if (versionMap[j].swfVersion == swfVersion) matchFount = true;
				if (versionMap[j].flashVersion == swfVersion) matchFount = true;
				if (matchFount) {
					//trace("AIR" + versionMap[j].airVersion);
					//airFlags.push(Std.string(versionMap[j].airVersion));
					
					haxe.macro.Compiler.define("AIR" + versionMap[j].airVersion);
				}
				j--;
			}
			
			//trace("airFlags = " + airFlags);
			
			//AirMacro.compilerDefine(airFlags);
		}
		
		//trace("str = " + str);
		
		//trace(Sys.args() + " " + Sys.getCwd());
		return Context.getBuildFields();
	}
}
#end

	

typedef VersionMapObject =
{
	swfVersion:Int,
	flashVersion:Float,
	airVersion:Null<Float>
}