package resources 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author l
	 */
	public class GraphicRecources 
	{
		
		public static const IMG_PUSHBOX:String			= "box.png";
		public static const IMG_LOCKBOX:String			= "boxAlt.png";
		public static const IMG_BLOCKBOX:String			= "castleCenter_rounded.png";
		public static const IMG_WALKBOX:String 			= "brickWall.png";
		public static const IMG_TARGETBOX:String		= "boxExplosive_disabled.png";
		public static const ANI_PLAYER_MINT:String 		= "alienGreen.png";
		public static const ANI_PLAYER_BLUBERRY:String	= "alienBlue.png";
		public static const ANI_PLAYER_LYCHEE:String 	= "alienPink.png";
		
		public static const IMG_REFRESH:String = "refresh.png";
		
		private static var _instance:GraphicRecources ;
		
		public function GraphicRecources  ()
		{
			if (_instance != null)
			{
				throw new Error("Class is singleton use instance");
			} 
			_instance = this;
		}

		
		public static function get instance():GraphicRecources 
		{
			if (!_instance)
			{
				new GraphicRecources();
			}
			return _instance;
			
		}
		
		private var vecRecources:Vector.<GraphicRecource> = new Vector.<GraphicRecource>();
		
		public function addBitmapData(aId:String, aBitmapData:BitmapData):void
		{
			var newRecource :GraphicRecource = new GraphicRecource();
			newRecource.recourceID = aId;
			newRecource.recourceBitmapData = aBitmapData;
			vecRecources.push(newRecource);
			
		}
		
		public function createBitmap(aID:String, aFlip:Boolean = false ):DisplayObject
		{
			var retbitmap:Bitmap = new Bitmap();
			
			for each(var recource:GraphicRecource in vecRecources)
			{
				if (recource.recourceID == aID)
				{
					var bData:BitmapData = recource.recourceBitmapData;
					if (aFlip)
					{
						bData = flipBitmapData(bData);
					}
					retbitmap.bitmapData  = bData;
					return retbitmap;
				}
			}
			trace("img: "+aID+ " not found");
			return retbitmap;
		}
		
		private function flipBitmapData(aBitmapData:BitmapData):BitmapData	
		{
			var retBitmapdata:BitmapData = new BitmapData(aBitmapData.width, aBitmapData.height,true,0);
			var flipMatrix:Matrix = new Matrix( -1, 0, 0, 1, aBitmapData.width, 0);

			retBitmapdata.draw(aBitmapData, flipMatrix, null, null, null, true);
			
			return retBitmapdata;
			
		}
		
		public function create9ScaledBitmap(aID:String, aWidth:int, aHeight:int):Bitmap
		{
			var targetData:BitmapData = new BitmapData(aWidth, aHeight);
			var sourceData:BitmapData = retrieveBitmapData(aID);
			var sourceRect:Rectangle = new Rectangle(0, 0, 20, 20);
			var destPoint:Point = new Point();
			
			targetData.copyPixels(sourceData, sourceRect, destPoint);
			
			sourceRect.x = sourceData.width - 20
			destPoint.x = aWidth - 20;
			targetData.copyPixels(sourceData, sourceRect, destPoint);
			
			sourceRect.y = sourceData.height -20;
			destPoint.y = aHeight-20
			targetData.copyPixels(sourceData, sourceRect, destPoint);
			
			destPoint.x = 0;
			sourceRect.x = 0;
			targetData.copyPixels(sourceData, sourceRect, destPoint);
			
			sourceRect.width = 1;
			sourceRect.x = 20;
			sourceRect.y = 0;
			destPoint.x = 20;
			destPoint.y = 0;
			
			while (destPoint.x < aWidth - 20)
			{
				targetData.copyPixels(sourceData, sourceRect, destPoint);
				destPoint.x++;
			}
			
			sourceRect.x = 20;
			sourceRect.y = sourceData.height - 20;
			destPoint.x = 20;
			destPoint.y =  aHeight - 20;
			while (destPoint.x < aWidth - 20)
			{
				targetData.copyPixels(sourceData, sourceRect, destPoint);
				destPoint.x++;
			}
			
			sourceRect.x = 0;
			sourceRect.y =  20;
			sourceRect.height = 1;
			sourceRect.width = 20;
			destPoint.x = 0;
			destPoint.y =  20;
			while (destPoint.y < aHeight - 20)
			{
				targetData.copyPixels(sourceData, sourceRect, destPoint);
				destPoint.y++;
			}
			
			sourceRect.x =  sourceData.width -20;
			sourceRect.height = 1;
			sourceRect.width = 20;
			destPoint.x = aWidth - 20;
			destPoint.y =  20;
			while (destPoint.y < aHeight - 20)
			{
				targetData.copyPixels(sourceData, sourceRect, destPoint);
				destPoint.y++;
			}
			
			
			destPoint.x = destPoint.x = 20;
			sourceRect.width = sourceRect.height = 1;
			sourceRect.x = sourceRect.y = 20;
			
			while (destPoint.x<aWidth-20)
			{
				destPoint.y = 20;
				while (destPoint.y<aHeight-20)
				{
					
					targetData.copyPixels(sourceData, sourceRect, destPoint);
					destPoint.y++;
					
				}
				destPoint.x++;
			}
			
			
			return new Bitmap(targetData);
		}
		
		public function createTiledBitmap(aID:String,aWidth:int,aHeight:int):Bitmap
		{
			var retBitmap:Bitmap = new Bitmap();
			
			for each(var recource:GraphicRecource in vecRecources)
			{
				if (recource.recourceID == aID)
				{
					var bData:BitmapData = new BitmapData(aWidth, aHeight);
					var tmpShape:Shape = new Shape();
					tmpShape.graphics.beginBitmapFill(recource.recourceBitmapData);
					tmpShape.graphics.drawRect(0, 0, aWidth, aHeight);
					tmpShape.graphics.endFill();
					bData.draw(tmpShape);
					retBitmap.bitmapData  = bData;
				}
			}
			return retBitmap;
		}
		

		
		private function retrieveBitmapData(aId:String):BitmapData
		{
			for each(var recource:GraphicRecource in vecRecources)
			{
				if (recource.recourceID == aId)
				{
					return recource.recourceBitmapData;
				}
			}
			return new BitmapData(100, 100,true,0xFFFF0000);
		}
		
		
		
	}

}