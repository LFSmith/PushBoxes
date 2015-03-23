package pushBoxesGame 
{
	import data.LevelModel;
	import data.Models;
	import flash.geom.Vector3D;
	import resources.GraphicRecources;
	/**
	 * ...
	 * @author l
	 */
	public class LevelParser
	{
		
		public function LevelParser() 
		{
			
		}
		
	
		static public function get totalLevels():int
		{
			return Models.instance.levels.elements.length;
		}
		
		static public function createPieceVector(aLevel:Number):Vector.<IGamePiece>
		{
			
			var vecReturn:Vector.<IGamePiece> = new Vector.<IGamePiece>();
			var xpos:int = 0;
			var ypos:int = 0;
			var strLevel:String = "";
			
			for each(var levelObj:LevelModel in Models.instance.levels.elements)
			{
				if (levelObj.level == aLevel)
				{
					strLevel = levelObj.levelData;
					break;
				}
			}
			
			for (var c:int = 0; c < strLevel.length; c++ )
			{
				var currchar:String = strLevel.substr(c, 1);
				var newpiece:IGamePiece = new BasicGamePiece; 
				
				switch(currchar)
				{
					case"#":
						{
							newpiece = new BasicGamePiece();
							newpiece.placePiece(xpos, ypos);
							newpiece.playerID = 0;
							newpiece.isPassable = false;
							newpiece.isDestroyable = false;
							newpiece.isPushable = false;
							newpiece.displayObj = PushBoxGraphics.instance.retrieveTile(GraphicRecources.IMG_BLOCKBOX); 
							xpos++;
							break;
						}
					case'-':
						{
							xpos++;
							continue;
							break;
						}
					case '.':
						{
						newpiece = new BasicGamePiece();
						newpiece.placePiece(xpos, ypos);
						newpiece.playerID = 0;
						newpiece.isPassable = true;
						newpiece.isDestroyable = false;
						newpiece.isPushable = false;
						newpiece.isTarget = true;
						newpiece.displayObj =PushBoxGraphics.instance.retrieveTile(GraphicRecources.IMG_TARGETBOX); 
						xpos++;
						break;
						}
					case '$':
						{
						newpiece = new BasicGamePiece();
						newpiece.placePiece(xpos, ypos);
						newpiece.playerID = 0;
						newpiece.isPassable = false;
						newpiece.isDestroyable = false;
						newpiece.isPushable = true;
						newpiece.displayObj = PushBoxGraphics.instance.retrieveTile(GraphicRecources.IMG_PUSHBOX); 
						xpos++;
						break;
						}
					case '@':
						{
						newpiece = new PlayerPiece();
						newpiece.placePiece(xpos, ypos);
						newpiece.playerID = 1;
						newpiece.isPassable = false;
						newpiece.isDestroyable = false;
						newpiece.isPushable = true;
						newpiece.displayObj = PushBoxGraphics.instance.retrievePlayerSprite(PushBoxGraphics.PLAYER_LEMON); 
						xpos++;
						break;
						}
					case'|':
						{
						ypos++;
						xpos = 0;
						continue;
						break;
					}
				default:
					{
						continue;
						break;
					}
					
				}
				
				vecReturn.push(newpiece);
			}
			
			
			
			return vecReturn;	
		}
		
	}

}