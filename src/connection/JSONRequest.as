package connection 
{
	import com.adobe.air.filesystem.events.FileMonitorEvent;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import com.adobe.serialization.json.JSON;
	/**
	 * ...
	 * @author l
	 */
	public class JSONRequest 
	{
		
		public function JSONRequest(aAdress:String,aComplete:Function=null) 
		{
			funcComplete = aComplete;
			adress = aAdress; 
		}
		
	
		protected var funcComplete:Function;
		protected var adress:String;
		protected var loader:URLLoader;
		
		public function load():void
		{
			loader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, onLoaderComplete);
			loader.load( new URLRequest(adress) );
		}
		
		protected function onLoaderComplete(e:Event):void 
		{
			loader.removeEventListener(Event.COMPLETE, onLoaderComplete);
			var jsonObj:Object = JSON.decode(loader.data);
			handleData(jsonObj);
			
		}
		
		protected function handleData(aJson:Object):void
		{
			ResponseParser.instance.parseResponse(aJson);
			triggerCompletefunction();
			
		}
		
		protected function triggerCompletefunction():void
		{
			if (funcComplete != null)
			{
				funcComplete.call();
			}
			Connections.instance.completeJSONRequest(this);
			removeSelfFromQue();
		}
		
		protected function removeSelfFromQue():void
		{
			Connections.instance.completeJSONRequest(this);
			
		}


	}

}