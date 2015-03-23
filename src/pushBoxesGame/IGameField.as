package pushBoxesGame 
{
	
	
	/**
	 * ...
	 * @author l
	 */
	public interface IGameField 
	{
		function GetPiecesAt(aXpos:int, aYpos:int):Vector.<IGamePiece>; 
		function SetupField(aLevel:Number):void;
		function set gameEndFunction(value:Function):void;
		 
	}
	
}