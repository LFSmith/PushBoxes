package windows.windows 
{
	import commands.commands.windowCommands.OpenMultifunctionWindowCommand;
	import flash.display.DisplayObject;
	import windows.components.SimpleButton;
	import windows.WindowGraphics;
	/**
	 * ...
	 * @author l
	 */
	public class MultiOptionWindow extends BaseWindow
	{
		
		public function MultiOptionWindow() 
		{
			
		}
		
		private var txtTitle:String = "";
		private var txtMessage:String = "";
		private var lblTitle:DisplayObject;
		private var lblMessage:DisplayObject;
		private var optionButtons:Vector.<DisplayObject> = new Vector.<DisplayObject>();
		private var btnsWidth:int = 0;
		
		override public function create():void 
		{
			
			
			lblTitle = WindowGraphics.instance.createTextObject(txtTitle, true);
			lblMessage = WindowGraphics.instance.createTextObject(txtMessage, false);
			
			
	
			if (lblMessage.width > lblTitle.width)
			{
				winWidth = lblMessage.width+20;
			}
			else
			{
				winWidth = lblTitle.width+20;
			}
			if (winWidth < 250)
			{
				winWidth = 250;
			}
			
			winHeight = lblMessage.height + lblTitle.height +40;
			if (optionButtons.length > 0)
			{
				winHeight += optionButtons[0].height;
			}
			
			addChild(WindowGraphics.instance.createWindowBackground(winWidth, winHeight));

			addElements(new <DisplayObject>[lblTitle],[5]);
			addElements(new <DisplayObject>[lblMessage],[5]);
			addElements(optionButtons,[5]);
		}
		
	
		public function setOptions(aTitle:String, aMessage:String,aFunctions:Vector.<Function>,aButtonTexts:Vector.<String>):void
		{
			optionButtons = new Vector.<DisplayObject>();
			txtTitle = aTitle;
			txtMessage = aMessage;
			for (var c:int = 0; c < aFunctions.length; c++ )
			{
				var btnText:String = "";
				var newBtn:SimpleButton;
				if (aButtonTexts.length > c)
				{
					btnText = aButtonTexts[c];
				}
				
				newBtn = WindowGraphics.instance.createButton(btnText,createOptionFunction(aFunctions[c]), true);
				btnsWidth += newBtn.width+5;
				optionButtons.push(newBtn);
			}
		
		}
		
	
	
	private function createOptionFunction(aFucntion:Function):Function
	{
		return function():void { aFucntion.call(); requestClose() };
	}
	}
}