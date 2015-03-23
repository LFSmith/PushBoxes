package pushBoxesGame 
{
	import com.adobe.crypto.SHA1;
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import caurina.transitions.Tweener
	/**
	 * ...
	 * @author l
	 */
	public class BasicGamePiece implements IGamePiece
	{
		
		public function BasicGamePiece() 
		{
			
		}
		
		private var _gField:IGameField;
		protected var _yPos:int;
		protected var _xPos:int;
		private var _isPassable:Boolean;
		private var _isPushable:Boolean;
		private var _isDestroyable:Boolean;
		private var _displayObj:flash.display.DisplayObject;
		private var _playerID:int;
		private var _positionChanged:Boolean=false;
		private var _isTarget:Boolean;
		
		
		private function checkIfInRange(xCheck:int, yCheck:int):Boolean
		{
			if (xCheck < 0)
				xCheck *= -1;
			if (yCheck < 0)
				yCheck *= -1;
			return true;
		}

		/* INTERFACE PushBoxesGame.IGamePiece */
		
		public function animateToPosition(aXMultiplier:int, aYMultiplier:int):void
		{
			var newX:int = _xPos * aXMultiplier;
			var newY:int =  _yPos * aYMultiplier;
			
			Tweener.addTween(displayObj, {time:1,x:newX,y:newY,onComplete:function():void{positionChanged = false;}} );
	
		}
		
		public function pushMove(aXCount:int, aYCount:int, aLeftWeight:int):Boolean 
		{
			var targetX:int = _xPos + aXCount;
			var targetY:int = _yPos + aYCount;
			if ( !checkIfInRange(targetX, targetY) || aLeftWeight<0 )
			{
				return false;
			}
			
			var vecNextPieces:Vector.<IGamePiece> = _gField.GetPiecesAt(targetX, targetY);
			
			if (vecNextPieces.length > 0)
			{
				for each (var nextPiece:IGamePiece in vecNextPieces)
				{
					if (nextPiece.isPassable)
					{
						continue;
					}
					if (!nextPiece.isPushable)
					{
						return false;
					}
					if (!nextPiece.pushMove(aXCount, aYCount, aLeftWeight))
					{
							return false;
					}
				}
				
			}

			_positionChanged = true;
			_xPos += aXCount;
			_yPos += aYCount;
			return true;
		}
		
		
	
		
		public function placePiece(aFieldX:int, aFieldY:int):void 
		{
			_yPos = aFieldY;
			_xPos = aFieldX;			
		}
		
		/* INTERFACE PushBoxesGame.IGamePiece */
		
		public function set positionChanged(value:Boolean):void 
		{
			_positionChanged = value;
		}
		
		public function get positionChanged():Boolean 
		{
			return _positionChanged;
		}
		
		public function get isTarget():Boolean 
		{
			return _isTarget;
		}
		
		public function set isTarget(value:Boolean):void 
		{
			_isTarget = value;
		}
		
		/* INTERFACE PushBoxesGame.IGamePiece */
		
		public function set playerID(value:int):void 
		{
			_playerID = value;
		}
		
		public function get playerID():int 
		{
			return _playerID;
		}
		
		public function set gField(value:IGameField):void 
		{
			_gField = value;
		}
		
		public function get yPos():int 
		{
			return _yPos;
		}
		
		public function get xPos():int 
		{
			return _xPos;
		}

		public function set isPassable(value:Boolean):void 
		{
			_isPassable = value;
		}
		
		public function get isPassable():Boolean 
		{
			return _isPassable;
		}
		
		public function set isDestroyable(value:Boolean):void 
		{
			_isDestroyable = value;
		}
		
		public function get isDestroyable():Boolean 
		{
			return _isDestroyable;
		}
		
		public function set displayObj(value:DisplayObject):void 
		{
			_displayObj = value;
		}
		
		public function get displayObj():DisplayObject 
		{
			if (_displayObj == null)
			{
				return new Shape();
			}
			return _displayObj;
		}
		
		public function set isPushable(value:Boolean):void 
		{
			_isPushable = value;
		}
		
		public function get isPushable():Boolean 
		{
			return _isPushable;
		}
		
	}

}