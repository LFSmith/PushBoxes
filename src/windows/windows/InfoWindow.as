package windows.windows 
{
	import flash.display.DisplayObject;
	import windows.components.SimpleButton
	import windows.WindowGraphics;
	/**
	 * ...
	 * @author l
	 */
	public class InfoWindow extends BaseWindow
	{
		
		public function InfoWindow() 
		{
			
		}
		
		private var txtTitle:String = "";
		private var txtMessage:String = "";
		private var lblTitle:DisplayObject;
		private var lblMessage:DisplayObject;
		private var btnOK:SimpleButton = new SimpleButton();
		
		override public function create():void 
		{
			btnOK = WindowGraphics.instance.createButton("OK", requestClose, true );
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
			
			winHeight = lblMessage.height + lblTitle.height +btnOK.height+40;
			
			addChild(WindowGraphics.instance.createWindowBackground(winWidth, winHeight));

			addElements(new <DisplayObject>[lblTitle],[10]);
			addElements(new <DisplayObject>[lblMessage],[5]);
			addElements(new <DisplayObject>[btnOK],[5]);

		}
		
		public function setMessage(aTitle:String, aMessage:String):void
		{
			txtTitle = aTitle;
			txtMessage = aMessage;
		}
		
	}

}