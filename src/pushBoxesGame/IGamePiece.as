package pushBoxesGame 
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	/**
	 * ...
	 * @author l
	 */
	public interface IGamePiece 
	{
		
		
		function animateToPosition(aXMultiplier:int, aYMultiplier:int):void;
		
		function pushMove(aXCount:int, aYCount:int, aLeftWeight:int):Boolean;
		
		function placePiece(aFieldX:int, aFieldY:int):void;
		
		function set gField(aGameField:IGameField):void;
		
		function get yPos():int;
		
		function get xPos():int;
		
		function set isPassable(value:Boolean):void;
		function get isPassable():Boolean;
		
		function set isDestroyable(value:Boolean):void;
		function get isDestroyable():Boolean;
		
		function set displayObj(value:DisplayObject):void;
		function get displayObj():DisplayObject;
		
		function set isPushable(value:Boolean):void;
		function get isPushable():Boolean;
		
		function set playerID(value:int):void;
		function get playerID():int;
		
		function set positionChanged(value:Boolean):void;
		function get positionChanged():Boolean;
		
		
		function get isTarget():Boolean;
		function set isTarget(value:Boolean):void;
		
		
		
		
		
	}
	
}