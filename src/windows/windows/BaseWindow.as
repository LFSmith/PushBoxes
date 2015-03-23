package windows.windows 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import windows.WindowController;
	import windows.WindowGraphics;
	/**
	 * ...
	 * @author l
	 */
	public class BaseWindow extends Sprite
	{
		public static const WINDOW_TYPE:String = "base_window";
		public function BaseWindow() 
		{
			
		}
		
		protected var winWidth:int = 0;
		protected var winHeight:int = 0;
		private var elementYEdge:int = 0;
		
		public function create():void
		{
			
		}
		
		public function requestClose():void
		{
			WindowController.instance.closeWindow(this);
		}
		public function prepareClose():void
		{
			
		}
		
		public function get WindowType():String
		{
			return WINDOW_TYPE;
		}
		
		public function get windowWidth():int
		{
				return winWidth;
		}
		
		public function get windowHeight():int
		{
			return winHeight;
		}
		
		protected function addElements(aElements:Vector.<DisplayObject>, aMargins:Array=null, aCenter:Boolean=true):void
		{
			var topMargin:int	= 0;
			var leftMargin:int 	= 0;
			var bottomMargin:int = 0;
			var rightMargin:int = 0;
			var totalWidth:int = 0;
			var totalHeight:int = elementYEdge;
			var maxRight:int = winWidth;
			var nextHeight:int = 0;
			var vecCurrentRow:Vector.<DisplayObject> = new Vector.<DisplayObject>();
			 
			 
			if(aMargins != null)
			{
				switch(aMargins.length)
				{
					case 0:
					{
						
					}
					break;
					
					case 1:
					{
						topMargin = leftMargin = bottomMargin = rightMargin = aMargins[0];
					}
					break;
					
					case 2:
					{
						leftMargin = rightMargin = aMargins[0];
						topMargin = bottomMargin = aMargins[1];
					}
					break;
					
					case 3 :
					{
						leftMargin = aMargins[0];
						bottomMargin = aMargins[1];
						rightMargin = aMargins[2];
					}
					break;
					
					default:
					{
						leftMargin = aMargins[0];
						bottomMargin = aMargins[1];
						rightMargin = aMargins[2];
						bottomMargin = aMargins[3];
					}
					break;
				}	
			}
			
			totalHeight = topMargin + elementYEdge;
			
			for each(var addElement:DisplayObject in aElements)
			{
				totalWidth += leftMargin;
				
				if (totalWidth + rightMargin + addElement.width <=maxRight)
				{
					addElement.x = totalWidth;
				}
				else
				{
					if (aCenter)
					{
						var rightShift:int = (winWidth - totalWidth) / 2;
						for each(var centerObject:DisplayObject in vecCurrentRow)
						{
								centerObject.x += rightShift;
						}
					}
					vecCurrentRow = new Vector.<DisplayObject>();
					addElement.x = leftMargin;
					totalHeight = nextHeight;
				}
				
				if (totalHeight + addElement.height +bottomMargin > nextHeight)
				{
					nextHeight = totalHeight + addElement.height +bottomMargin;
				}
				totalWidth = addElement.x + addElement.width + rightMargin;
				addElement.y = totalHeight;
				vecCurrentRow.push(addElement);
				addChild(addElement);
				
			}
			if (aCenter)
					{
						var rightShift:int = (winWidth - totalWidth) / 2;
						for each(var centerObject:DisplayObject in vecCurrentRow)
						{
								centerObject.x += rightShift;
						}
					}
			
			
			
			elementYEdge = nextHeight;

		}
		
		
	
	}	
		

}