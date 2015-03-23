package windows.components 
{
	import adobe.utils.CustomActions;
	import flash.display.DisplayObject;
	import flash.display.JointStyle;
	import flash.display.PixelSnapping;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.engine.DigitWidth;
	import resources.SoundRecources;
	/**
	 * ...
	 * @author l
	 */
	public class SimpleButton extends Sprite
	{
		
		public function SimpleButton() 
		{
			
			addEventListener(MouseEvent.CLICK, onClick,false,0,false);
			addEventListener(MouseEvent.ROLL_OVER,onOver,false,0,false);
			addEventListener(MouseEvent.ROLL_OUT, onOut, false, 0, false);
			addEventListener(MouseEvent.MOUSE_DOWN,onDown, false, 0, false);
			
		}
		
		
		private var  _btnState:int = 0;
		private var _clickFunction:Function ;
		private var _overFunction:Function;
		private var _outFunction:Function;
		private var _onlyFireOnce:Boolean = false;
		private var hitbox:Sprite;
		private var vecStateButtons:Vector.<DisplayObject>;
		private var mouseIsOver:Boolean = false;
		private var _textObject:DisplayObject = null;
		
		

		private function onOut(e:MouseEvent):void 
		{
			mouseIsOver = false;
			btnState = 1;
			if (_outFunction != null)
			{
				_outFunction.call();
			}
			
		}
		
		private function onOver(e:MouseEvent):void 
		{
			mouseIsOver  = true;
			btnState = 2;
			if (_overFunction != null)
			{
				_overFunction.call();
			}
		}
		
		
		
		private function onDown(e:MouseEvent):void 
		{
			btnState = 3;
		}
		private function onClick(e:MouseEvent):void 
		{
			SoundRecources.instance.playeffect(0)
			if (mouseIsOver)
			{
				btnState = 1;
			}else
			{
				btnState = 2;
			}
			if (_clickFunction != null)
			{
				_clickFunction.call();
				if (_onlyFireOnce)
				{
					_clickFunction = null;
				}
			}
			
		}
		
		public function set textObject(value:DisplayObject):void
		{
			_textObject = value;
			addChild(_textObject);
			centerTextObject();
		}
		
		public function set clickFunction(value:Function):void
		{
			_clickFunction = value;
		}
		
		public function set overFunction(value:Function):void
		{
			_overFunction = value
		}
		
		public function set outFunction(value:Function):void
		{
			_outFunction = value;
		}
		
	
		
		public function set onlyFireOnce(value:Boolean):void
		{
			_onlyFireOnce = value;
		}
		
		private function set btnState(value:int):void
		{
			 _btnState = value;
			for (var c :int = 0; c < vecStateButtons.length;c++ )
			{
				if (vecStateButtons[c] != null)
				{
					if (c+1 == value)
					{
						addChild(vecStateButtons[c]);
						
					}else
					{
						if (vecStateButtons[c].parent != null )
						{
							vecStateButtons[c].parent.removeChild(vecStateButtons[c]);
						}
					}
				}
			}
			if (_textObject != null)
			{
				addChild(_textObject);
				centerTextObject();
			}
		}
		
		private function get btnState():int
		{
			return _btnState;
		}
		
		/**
		 *  Accepts an vector containing idle mouseover and  click images in that order, hitbox is determined by the widest and highest images passed.	
		*/
		public function setStateButtons(aStateButtons:Vector.<DisplayObject>):void
		{
			var btnWidth:int = 0;
			var btnHeight:int = 0;
			vecStateButtons = aStateButtons;
			for each (var stateObj:DisplayObject in aStateButtons)
			{
				if (stateObj != null)
				 {
					 if (stateObj.width > btnWidth)
					 {
						 btnWidth = stateObj.width;
					 }
					 
					 if (stateObj.height > btnHeight)
					 {
						 btnHeight = stateObj.height;
					 }
					 
					 stateObj.x = stateObj.y = 0;
					 
				 }	 
			}
			btnState = 1;
			hitbox = new Sprite();
			hitbox.graphics.beginFill(0,0);
			hitbox.graphics.drawRect(0, 0, btnWidth, btnHeight);
			hitbox.graphics.endFill();
			addChild(hitbox);
			hitArea = hitbox;
			
			centerTextObject();
		}
		
		private function centerTextObject():void 
		{
			if (_textObject != null && hitbox != null)
			{
				_textObject.x = ( (hitbox.width - _textObject.width) / 2 );
				_textObject.y = ( (hitbox.height - _textObject.height) / 2 );
				
			}
		}
		
	}

}
