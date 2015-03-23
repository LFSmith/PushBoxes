package windows 
{
	import caurina.transitions.properties.DisplayShortcuts;
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import resources.GraphicRecource;
	import resources.GraphicRecources;
	import resources.StringRecources;
	import windows.components.SimpleButton;
	import flash.text.Font;
	import flash.text.TextFormatAlign;
	/**
	 * ...
	 * @author l
	 */
	public class WindowGraphics 
	{
		public static const SYMBOL_MUSIC:String = "muon";
		public static const SYMBOL_MUSIC_OFF:String = "muoff";
		public static const SYMBOL_SOUND:String = "effon";
		public static const SYMBOL_SOUND_OFF:String = "effoff";
		public static const SYMBOL_DELETE:String = "killdata";
		
		
		private static var _instance:WindowGraphics;

		[Embed(source = "../../lib/fonts/kenvector_future_thin.ttf" ,fontName = "kenny", mimeType = "application/x-font", 
		fontWeight="normal", 
		fontStyle="normal", 
		embedAsCFF="false")]
		private var kenvector_future_thin:Class;
		public function WindowGraphics ()
		{
			if (_instance != null)
			{
				throw new Error("Class is singleton use instance");
			} 
			Font.registerFont(kenvector_future_thin);
			_instance = this;
		}
		
		public static function get instance():WindowGraphics 
		{
			if (!_instance)
			{
				new WindowGraphics ();
			} 
			return _instance;
		}
		
		
		public function createWindowBackground(aWidth:int, aHeight:int):DisplayObject
		{
			/*var retshape:Shape = new Shape();
			
			retshape.graphics.beginFill(0x33CCCC);
			retshape.graphics.drawRect(0, 0, aWidth, aHeight);
			
			retshape.graphics.beginFill(0x660022);
			retshape.graphics.drawRect(10, 10, aWidth-20, aHeight-20);
			retshape.graphics.endFill();
			return retshape;*/
			 return GraphicRecources.instance.create9ScaledBitmap("red_panel.png", aWidth, aHeight);
			
		}
		
		public function createTextObject(aText:String, aBigText:Boolean=false):DisplayObject
		{
			var textsize:int = 16;
			if (aBigText)
			{
				textsize = 30;
			}
			var format:TextFormat = new TextFormat("kenny",textsize);
			format.font = "kenny";
			format.align = TextFormatAlign.CENTER;
			var retLabel:TextField = new TextField();
			retLabel.embedFonts = true;
			retLabel.defaultTextFormat = format;
			retLabel.text = aText;
			retLabel.selectable = false;
			retLabel.autoSize = TextFieldAutoSize.CENTER;
			
			return retLabel;
		}
		
		public function createButton(aText:String,aFunction:Function,isFireOnce:Boolean=false):SimpleButton
		{
			var retButton:SimpleButton = new SimpleButton();

			retButton.onlyFireOnce = isFireOnce;
			retButton.clickFunction = aFunction;
			retButton.setStateButtons(new < DisplayObject > [GraphicRecources.instance.createBitmap( "red_button02.png"), GraphicRecources.instance.createBitmap( "red_button01.png"), GraphicRecources.instance.createBitmap( "red_button00.png")]);
			retButton.textObject = createTextObject(aText,true);
			return retButton;
		}
		
		public function createSymbol(aSymbolID:String):DisplayObject
		{
			return GraphicRecources.instance.createBitmap(aSymbolID + ".png");
			
		}
		public function createSymbolButton(aSymbolID:String, aCLickfunction:Function = null,aOverFunction:Function=null,aOutFunction:Function = null ):SimpleButton
		{
			var retButton:SimpleButton = new SimpleButton();
			retButton.clickFunction = aCLickfunction;
			retButton.overFunction = aOverFunction;
			retButton.outFunction = aOutFunction;
			
			retButton.setStateButtons(new <DisplayObject>[GraphicRecources.instance.createBitmap(aSymbolID+".png"),GraphicRecources.instance.createBitmap(aSymbolID+"_mo.png"),GraphicRecources.instance.createBitmap(aSymbolID+"_mo.png")]);
			return retButton;
			
		}
		

	}

}