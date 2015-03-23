package visual 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author l
	 */
	public class AniSprite extends Sprite
	{
		
		public function AniSprite() 
		{
			
		}
		
		private var animationvecs:Array = new Array();
		private var currentAnimationIndex:uint = 0;
		private var currentFrameIndex:uint = 0;
		private var currentFrameObj:DisplayObject = null;
		private var framesPerImage:uint = 20;
		private var lastFrameCount:uint = 0;
		
		public function addAnimation(aAnivec:Vector.<DisplayObject>):void
		{
			animationvecs.push(aAnivec);
		}
		
		public function setAnimation(aId:uint):void
		{
			if (aId < animationvecs.length)
			{
				
				pauseAnimation();
				currentAnimationIndex = aId;
				currentFrameIndex = 0;
				showCurrentFrame();
			}
		}
		
		private function onFrame(e:Event = null):void
		{
			lastFrameCount++;
			if (framesPerImage <= lastFrameCount)
			{
				lastFrameCount = 0;
				moveToNextFrame();
				showCurrentFrame();
			}
			
		}
		
		private function moveToNextFrame():void
		{
			currentFrameIndex++;
			if (currentFrameIndex >= animationvecs[currentAnimationIndex].length)
			{
				currentFrameIndex = 0;
			}
		}
		
		private function showCurrentFrame():void 
		{
			if (currentFrameObj != null)
			{
				currentFrameObj.parent.removeChild(currentFrameObj);
			}
			currentFrameObj=animationvecs[currentAnimationIndex][currentFrameIndex]
			addChild(currentFrameObj);
			
		}
		
		public function playAnimation():void
		{
			if (!hasEventListener(Event.ENTER_FRAME) )
				{
					addEventListener(Event.ENTER_FRAME,onFrame);
				}
		}
		public function pauseAnimation():void
		{
			if (hasEventListener(Event.ENTER_FRAME) )
			{
				removeEventListener(Event.ENTER_FRAME,onFrame);
			}
		}
		
	}

}