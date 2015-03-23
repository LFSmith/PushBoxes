package utils 
{
	import flash.display.Stage;
	import flash.events.KeyboardEvent
	/**
	 * ...
	 * @author l
	 */
	public class KeyboardEventUtil 
	{
		
		public function KeyboardEventUtil() 
		{
			
		}
		

		private static var _instance:KeyboardEventUtil;
		private var callbacks:Vector.<Function>= new Vector.<Function>();	
		
		public static function get instance():KeyboardEventUtil
		{
			if (_instance == null)
			{	
				_instance = new KeyboardEventUtil();
			}
				
			return	_instance;
		}
		private var stageref:Stage = null;
		public function init(aStage:Stage):void
		{
			stageref = aStage;
			stageref.addEventListener(KeyboardEvent.KEY_UP,keyHandler);
		}
		
		public function addCallback(aFunction:Function):void
		{
			callbacks.push(aFunction);
		
		}
		
		public function removeCallback(aFunction:Function):void
		{
			var intPos:int = callbacks.lastIndexOf(aFunction);
			while (intPos > -1)
			{
				callbacks.splice(intPos, 1);
			}
		}
		
		private function keyHandler(e:KeyboardEvent):void 
		{
			for each (var fun:Function in callbacks)
			{
				fun.call(null, e.keyCode);
			}
		}
		
		
		
		
		
		
		
		
	}

}