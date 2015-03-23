package  
{
	import flash.display.Sprite;
	import flash.text.TextField;
	/**
	 * ...
	 * @author l
	 */
	public class LoadSprite extends Sprite
	{
		
		public function LoadSprite() 
		{
			progress = 0;
		}
		private var lblLoad:TextField = new TextField();
		
		public function set loadMessage(aString:String):void
		{
			lblLoad.text = aString;
		}
		
		public function set progress(aValue:int):void
		{
			var BarWidth:int = 300;
			var BarHeight:int = 30;
			graphics.clear();
			graphics.beginFill(0x993333);
			graphics.drawRect(0, 0, BarWidth, BarHeight);
			graphics.beginFill(0x006633);
			graphics.drawRect(4, 4, (BarWidth / 100 *aValue) - 8, BarHeight - 8);

		}
	}

}