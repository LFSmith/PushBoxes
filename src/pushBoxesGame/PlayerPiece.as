package pushBoxesGame 
{
	import visual.AniSprite;
	import caurina.transitions.Tweener;
	/**
	 * ...
	 * @author l
	 */
	public class PlayerPiece extends BasicGamePiece
	{
		private static const IDLE:int = 0;
		private static const LEFT:int = 1;
		private static const DOWN:int = 2;
		private static const RIGHT:int = 3;
		private static const UP:int = 4;
		
		public function PlayerPiece() 
		{
			
		}
		
		override public function animateToPosition(aXMultiplier:int, aYMultiplier:int):void 
		{
			var newX:int = _xPos * aXMultiplier;
			var newY:int =  _yPos * aYMultiplier;
		
			
			
				if (newX != displayObj.x)
				{
					if (newX > displayObj.x)
					{
						aniId = RIGHT;
					}else
					{
						aniId = LEFT;
					}
					
				}else if (newY != displayObj.y)
				{
					if (newY > displayObj.y)
					{
						aniId = DOWN;
					}else
					{
						aniId = UP;
					}
					
				}
				

			Tweener.addTween(displayObj, {time:1,x:newX,y:newY,onComplete:animationComplete,transition:"none"}  );
		}
		
		private function animationComplete():void
		{
			positionChanged = false
			aniId = IDLE;
		
		}
		
		private function set aniId(value:int):void
		{
			if (displayObj is AniSprite)
			{
				AniSprite(displayObj).setAnimation(value);
				AniSprite(displayObj).playAnimation();
			}
		}
		
		
	}

}