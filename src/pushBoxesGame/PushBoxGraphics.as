package pushBoxesGame 
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import resources.GraphicRecource;
	import resources.GraphicRecources;
	import visual.AniSprite;
	/**
	 * ...
	 * @author l
	 */
	public class PushBoxGraphics 
	{
		public static const PLAYER_KIWI:String = "alienBeige";
		public static const PLAYER_BLUEBERRY:String = "alienBlue";
		public static const PLAYER_MINT:String = "alienGreen";
		public static const PLAYER_LYCHEE:String = "alienPink";
		public static const PLAYER_LEMON:String = "alienYellow";
		
		private static var _instance:PushBoxGraphics ;
		
		public function PushBoxGraphics ()
		{
			if (_instance != null)
			{
				throw new Error("Class is singleton use instance");
			} 
			_instance = this;
		}

		public static function get instance():PushBoxGraphics 
		{
			if (!_instance)
			{
				new PushBoxGraphics ();
			} 
			return _instance;
		}
		
		public function retrievePlayerSprite(aSpriteId:String):AniSprite
		{
			var walkUp1:DisplayObject = GraphicRecources.instance.createBitmap(aSpriteId+"_climb1.png");
			var walkUp2:DisplayObject = GraphicRecources.instance.createBitmap(aSpriteId+"_climb2.png");
			
			var walkDown1:DisplayObject = GraphicRecources.instance.createBitmap(aSpriteId+"_climb1.png");
			var walkDown2:DisplayObject = GraphicRecources.instance.createBitmap(aSpriteId+"_climb2.png");
			
			var walkRight1:DisplayObject = GraphicRecources.instance.createBitmap(aSpriteId+"_walk1.png");
			var walkRight2:DisplayObject =  GraphicRecources.instance.createBitmap(aSpriteId+"_walk2.png");
			
			var walkLeft1:DisplayObject= GraphicRecources.instance.createBitmap(aSpriteId+"_walk1.png",true);
			var walkLeft2:DisplayObject = GraphicRecources.instance.createBitmap(aSpriteId+"_walk2.png",true);
			
			var idle1:DisplayObject = GraphicRecources.instance.createBitmap(aSpriteId+".png");;
			var idle2:DisplayObject = GraphicRecources.instance.createBitmap(aSpriteId+"_stand.png");
			
			walkUp1.width = walkUp2.width = walkDown1.width = walkDown2.width = walkRight1.width = walkRight2.width= walkLeft1.width = walkLeft2.width = idle1.width = idle2.width = 70;
			walkUp1.height = walkUp2.height = walkDown1.height = walkDown2.height = walkRight1.height = walkRight2.height= walkLeft1.height = walkLeft2.height = idle1.height = idle2.height = 70;
			
			var retSprite:AniSprite = new AniSprite();
			
			var idle:Vector.<DisplayObject> = new <DisplayObject>[idle1,idle2];
			var walkLeft:Vector.<DisplayObject>	= new <DisplayObject>[walkLeft2,walkLeft1];
			var walkRight:Vector.<DisplayObject> = new <DisplayObject>[walkRight2,walkRight1];
			var walkUp:Vector.<DisplayObject> = new <DisplayObject>[walkUp1,walkUp2];
			var walkDown:Vector.<DisplayObject> = new <DisplayObject>[walkDown1,walkDown2];
			
			retSprite.addAnimation(idle);
			retSprite.addAnimation(walkLeft);
			retSprite.addAnimation(walkDown);
			retSprite.addAnimation(walkRight);
			retSprite.addAnimation(walkUp);
			retSprite.playAnimation();
			return retSprite;	
		}
		
		
		public function retrieveTile(aTileId:String):DisplayObject
		{
			return GraphicRecources.instance.createBitmap(aTileId);
		}
		
	}

}