package  pushBoxesGame
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import pushBoxesGame.BasicGamePiece;
	import pushBoxesGame.IGameField;
	import pushBoxesGame.IGamePiece;
	import utils.DisplayUtil;
	import utils.KeyboardEventUtil;
	import pushBoxesGame.BasicGameFieldSprite;
	/**
	 * ...
	 * @author l
	 */
	public class BasicGameFieldSprite extends Sprite implements IGameField
	{
		public static const CELL_SIZE:int = 70;
		
		public function BasicGameFieldSprite() 
		{
			KeyboardEventUtil.instance.addCallback(keycallback);
		}
		
		private var gf:IGameField;
		private var vecGamePieces:Vector.<IGamePiece> = new Vector.<IGamePiece>();
		private var vecTargetPieces:Vector.<IGamePiece> = new Vector.<IGamePiece>();
		private var vecPushBoxPieces:Vector.<IGamePiece> = new Vector.<IGamePiece>();
		private var playerPiece:IGamePiece = new BasicGamePiece();
		private var _gameEndFunction:Function;
		private var gameEnded:Boolean = false;
	
		
		/* INTERFACE PushBoxesGame.IGameField */
		
		public function GetPiecesAt(aXpos:int, aYpos:int):Vector.<IGamePiece>
		{
			var vecFoundPieces:Vector.<IGamePiece>=new Vector.<IGamePiece>();
			for each (var gamePiece:IGamePiece in vecGamePieces)
			{
				if (gamePiece.xPos == aXpos && gamePiece.yPos == aYpos)
				{
					vecFoundPieces.push(gamePiece);
				}
			}
			
			return vecFoundPieces;
		}
		
		public function SetupField(aLevel:Number):void 
		{
			gameEnded = false;
			for each(var gamePiece:IGamePiece in vecGamePieces)
			{
				gamePiece.gField = null;
				if (gamePiece.displayObj.parent != null)
				{
					gamePiece.displayObj.parent.removeChild(gamePiece.displayObj);
					gamePiece.displayObj = null;
				}
			}
			vecTargetPieces = new Vector.<IGamePiece>();
			vecPushBoxPieces = new Vector.<IGamePiece>();
			vecGamePieces = LevelParser.createPieceVector(aLevel);
			addPieces();
			
			
		}
		/* INTERFACE PushBoxesGame.IGameField */
		
		
		public function keycallback(keycode:int):void 
		{
			
			if (playerPiece == null)
				return;
			switch(keycode)
			{
				//up
				case 38 :
					playerPiece.pushMove(0,-1,1);
					break;
				//down
				case 40:
					playerPiece.pushMove(0,1,1) ;
					break;
				//right
				case 39:
					 playerPiece.pushMove(1,0,1) ;
					break;
				//left
				case 37:
					playerPiece.pushMove(-1,0,1) ;
					break;
			}
			
			animatePiecesToPos();
		}
		
		/* INTERFACE PushBoxesGame.IGameField */
		
		public function set gameEndFunction(value:Function):void 
		{
			_gameEndFunction = value;
		}
		
		private function animatePiecesToPos():void 
		{
			for each (var gamePiece:IGamePiece in vecGamePieces)
			{
				gamePiece.animateToPosition(CELL_SIZE, CELL_SIZE);
				
			}
			checkWin();
		}
		//asumes target and pushboxes are not stackale and that targets pushed onto other targets as well as player pieces do no count toward goal
		
		private function checkWin():void 
		{
			var foundMatches:int = 0;
			for each(var targetPiece:IGamePiece in vecTargetPieces)
			{
				for each(var gamePiece:IGamePiece in vecGamePieces)
				{
					if (!gamePiece.isTarget && gamePiece.xPos == targetPiece.xPos && targetPiece.yPos == gamePiece.yPos &&gamePiece.playerID==0)
					{
						foundMatches++;
					}
				}	
			}
			
			if (foundMatches == vecTargetPieces.length)
			{
				finishGame();
			}
		}
		
		private function finishGame():void 
		{
			if (!gameEnded)
			{
				gameEnded = true;
				if (_gameEndFunction != null)
				{
					_gameEndFunction.call();;
				}
			}
			
		}
		
		private function addPieces():void 
		{
			for each (var gamePiece:IGamePiece in vecGamePieces)
			{
				gamePiece.displayObj.x = gamePiece.xPos * CELL_SIZE;
				gamePiece.displayObj.y = gamePiece.yPos * CELL_SIZE;
				addChild(gamePiece.displayObj);
				
				if (gamePiece.playerID == 1)
				{
					playerPiece = gamePiece;
				}
				
				if (gamePiece.isTarget)
				{
					vecTargetPieces.push(gamePiece);
				}
				
				if (gamePiece.isPushable)
				{
					vecPushBoxPieces.push(gamePiece);
				}
				
				gamePiece.gField = this;
			}
			
			for each( var pushBoxPiece:IGamePiece in vecPushBoxPieces)
			{
				addChild(pushBoxPiece.displayObj);
			}
			
			if (playerPiece != null)
			{
				addChild(playerPiece.displayObj);
			}
			
		}
		
		

	
		
		
		
	}

}