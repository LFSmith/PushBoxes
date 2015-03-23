package windows.components 
{
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import windows.WindowGraphics;
	import flash.events.MouseEvent;
	import caurina.transitions.Tweener;
	/**
	 * ...
	 * @author l
	 */
	public class SideBar extends Sprite
	{
		
		public function SideBar(aElemensts:Vector.<DisplayObject>) 
		{
			
			
			var lastAdded:DisplayObject = null;
			
			for each(var addObj:DisplayObject in aElemensts)
			{
				
				if (lastAdded != null)
				{
					addObj.y += lastAdded.height + lastAdded.y+3;
				}
				lastAdded = addObj;
				addChild(addObj);
			}
			
			background = WindowGraphics.instance.createWindowBackground(this.width + 20, this.height + 20);
			background.x = background.y = -10;
			addChildAt(background, 0);
			addEventListener(MouseEvent.ROLL_OUT, onEvent);
			addEventListener(MouseEvent.ROLL_OVER,onEvent);
		}
		
		private var background:DisplayObject = null;
		
		private var _expandedX:int = 0;
		
		public function set expandedX(value:int):void
		{
			_expandedX = value;
			contract();
		}
		
		private function expand():void
		{
			Tweener.addTween(this, { x:_expandedX, time :1 } );
		}
		
		private function contract():void
		{
			Tweener.addTween(this, { x:_expandedX + width - 10, time :1 } );
		}
		
		private function onEvent(e:Event):void
		{
			switch(e.type)
			{
				case MouseEvent.ROLL_OUT:
					contract();		
				break;
				case MouseEvent.ROLL_OVER:
					expand();
				break
				
				default:
					break;
			}
		}
		
		
	}

}