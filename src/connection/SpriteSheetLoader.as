package connection 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	import resources.GraphicRecources;
	/**
	 * ...
	 * @author l
	 */
	public class SpriteSheetLoader  extends JSONRequest
	{
		private static const IMG_BASE_PATH:String = "../lib/sheets/";
		
		public function SpriteSheetLoader(aAdress:String,aCompleteFunction:Function=null)
		{
			super(aAdress,aCompleteFunction);
		}
		
		private var sheetData:Object;
		private var sheetLoader:Loader;

		override protected function handleData(aJson:Object):void 
		{
			sheetData = aJson;
			sheetLoader = new Loader();
			
			sheetLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onSheetLoaded);
			sheetLoader.load(new URLRequest(IMG_BASE_PATH + aJson["TextureAtlas"]["-imagePath"]));
		}
		
		private function onSheetLoaded(e:Event):void
		{
			sheetLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onSheetLoaded);
			var BMPData:BitmapData =  Bitmap(sheetLoader.content).bitmapData;
			if (sheetData["TextureAtlas"]["SubTexture"] != null)
			{
				for each(var imgInfo:Object in sheetData["TextureAtlas"]["SubTexture"])
				{
					var imgName:String = imgInfo["-name"];
					var imgX:int = imgInfo["-x"];
					var imgY:int =  imgInfo["-y"];
					var imgWidth:int = imgInfo["-width"];
					var imgHeight:int = imgInfo["-height"];
					var imgBMPData:BitmapData = new BitmapData(imgWidth, imgHeight);
					imgBMPData.copyPixels(BMPData, new Rectangle(imgX, imgY, imgWidth, imgHeight), new Point(0,0) );
					GraphicRecources.instance.addBitmapData(imgName, imgBMPData);	
				}
			}else if (sheetData["TextureAtlas"]["frames"] != null)
			{
				for each(var frameImgInfo:Object in sheetData["TextureAtlas"]["frames"])
				{
					var imgName:String = frameImgInfo["filename"];
					var imgX:int = frameImgInfo["frame"]["x"];
					var imgY:int =  frameImgInfo["frame"]["y"];
					var imgWidth:int = frameImgInfo["frame"]["w"];
					var imgHeight:int = frameImgInfo["frame"]["h"];
					var imgBMPData:BitmapData = new BitmapData(imgWidth, imgHeight);
					imgBMPData.copyPixels(BMPData, new Rectangle(imgX, imgY, imgWidth, imgHeight), new Point(0,0) );
					GraphicRecources.instance.addBitmapData(imgName, imgBMPData);	
				}
				
			}
			triggerCompletefunction();
			removeSelfFromQue();
		}
		
	}

}