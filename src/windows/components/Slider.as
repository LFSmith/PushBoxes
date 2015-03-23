package windows.components 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import resources.GraphicRecources;
	import flash.events.MouseEvent;
	import windows.WindowGraphics;
	/**
	 * ...
	 * @author l
	 */
	public class Slider extends Sprite
	{
		
		public function Slider(aSymbol:DisplayObject) 
		{
			aSymbol.x = 8;
			aSymbol.y = 6;
			lineStart = aSymbol.y + aSymbol.width +10;
			addChild(aSymbol);
			handleSprite.addChild(GraphicRecources.instance.createBitmap("red_circle.png"));
			handleSprite.y = aSymbol.y + (aSymbol.height / 2) - (handleSprite.height / 2);
			barSprite.graphics.lineStyle(10, 4);
			barSprite.graphics.moveTo(lineStart, handleSprite.y+handleSprite.height / 2 );
			barSprite.graphics.lineTo(sliderwidth+lineStart,  handleSprite.y+handleSprite.height / 2 );
			addChild(barSprite);
			addChild(handleSprite);
			addChildAt(WindowGraphics.instance.createWindowBackground(this.width+10, this.height+11), 0);
			barSprite.addEventListener(MouseEvent.CLICK, onMouseEvent);
			handleSprite.addEventListener( MouseEvent.MOUSE_DOWN, onMouseEvent);
			handlePosition = lineStart+(sliderwidth/2)-6-(handleSprite.width/2);
				
		}

		private function onMouseEvent(e:MouseEvent):void 
		{
			switch(e.type)
			{
				case MouseEvent.CLICK:
					break;
				case MouseEvent.MOUSE_DOWN:
					stage.addEventListener(MouseEvent.MOUSE_UP, onMouseEvent);
					stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseEvent);
					mouseIsDown = true;
					break;
				case MouseEvent.ROLL_OUT:
				case MouseEvent.MOUSE_UP:
					stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseEvent);
					stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseEvent);
					mouseIsDown = false;
					break;
				case MouseEvent.MOUSE_MOVE:
					if (mouseIsDown)
					{
						handlePosition = this.mouseX;
					}
					break;
			}
		}
		
		
		
		private var sliderwidth:int = 200;
		private var lineStart:int = 0;
		private var _updateFunction:Function;
		private var _sliderPercent:Number = 0;
		private var handleSprite:Sprite = new Sprite();
		private var barSprite:Sprite = new Sprite();
		private var mouseIsDown:Boolean = false;
		
		private function set handlePosition(value:int):void
		{
			var position:Number;
			if (value > sliderwidth+lineStart-handleSprite.width+6)
			{
				position = sliderwidth+lineStart-handleSprite.width+6;
			}
			else if (value < lineStart-6)
			{
				position = lineStart-6;
			}
			else 
			{
				position = value;
				
			}
			
			_sliderPercent = ((position - lineStart - 6) / (sliderwidth - handleSprite.width + 6)) + 0.07058823529411765;

			handleSprite.x = position;
			if (_updateFunction != null)
			{
				_updateFunction.call();
			}
		}
		public function set updateFunction(value:Function):void
		{
			_updateFunction = value;
		}
		
		public function get sliderPercent():Number
		{
			return _sliderPercent;
		}
		
		
		
	}

}