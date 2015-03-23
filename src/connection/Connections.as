package connection 
{
	import adobe.utils.CustomActions;
	import commands.CommandExecuter;
	/**
	 * ...
	 * @author l
	 */
	public class Connections
	{
		
		private static var _instance:Connections;
		private static const BASE_ADDRESS:String = "JSON/"
		private static const BASE_FILE_EXT:String = ".json";
		private var initData:Array = ["levels", "localization", "imgjsons"];
		private var initQue:Array = [];
		private var completeInitFunction:Function = null;
		private var JsonRequests:Vector.<JSONRequest> = new Vector.<JSONRequest>();
		
		
		public function Connections()
		{
			if (_instance != null)
			{
				throw new Error("Class is singleton use instance");
			} 
			_instance = this;
		}
		

		public static function get instance():Connections
		{
			if (!_instance)
			{
				new Connections();
			} 
			
			return _instance;
		}
		
		
		
		public function updateData(aType:String,aComplete:Function=null):void
		{
			var adress:String = BASE_ADDRESS + aType + BASE_FILE_EXT;
			var request:JSONRequest = new JSONRequest(adress,aComplete);
			request.load();	
		}
		
		
	
		public function addJSONRequest(aRequest:JSONRequest):void
		{
			JsonRequests.push(aRequest);
			if (JsonRequests.length == 1)
			{
				loadNextJSONRequest();
			}
			
		}
		
		private function loadNextJSONRequest():void
		{
			if (JsonRequests.length == 0)
			{
				return;
			}
			JsonRequests[0].load();
		}
		
		public function completeJSONRequest(aRequest:JSONRequest):void
		{
			var quePos:int = JsonRequests.indexOf(aRequest);
			if (quePos < 0)
			{
				return;
			}
			JsonRequests.splice(quePos, 1);
			if (JsonRequests.length >0)
			{
				loadNextJSONRequest()
			}
			
		}
		private function removeInitQueItem(aItem:String):void
		{
			if (initQue.length == 0)
			{
				return;
			}
			if (initQue.indexOf(aItem) > -1)
			{
				initQue.splice(initQue.indexOf(aItem), 1);
			}
			if (initQue.length == 0)
			{
				if (completeInitFunction != null)
				{
					completeInitFunction.call();
				}
			}
		}
		
		public function initload(aCompleteFunction:Function):void 
		{
			completeInitFunction = aCompleteFunction;
			for each (var type:String in initData)
			{
				addInitItem(type);
				updateData(type,createRemoveInintFunction(type));
			}
		}
		
		public function addInitItem(aItem:String):void
		{
			initQue.push(aItem);
			
		}
		
		public function createRemoveInintFunction(aItem:String):Function
		{
			return function():void { removeInitQueItem(aItem)};
		}
		
	}

}