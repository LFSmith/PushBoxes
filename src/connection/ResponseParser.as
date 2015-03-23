package connection 
{
	import data.Models;
	import resources.StringRecources;
	/**
	 * ...
	 * @author l
	 */
	public class ResponseParser 
	{
		
		private static var _instance:ResponseParser;
		
		public function ResponseParser()
		{
			if (_instance != null)
			{
				throw new Error("Class is singleton use instance");
			} 
			_instance = this;
		}

		public static function get instance():ResponseParser
		{
			if (!_instance)
			{
				new ResponseParser();
			} 
			return _instance;
		}
		
		public function parseResponse(aResponse:Object):void
		{
			for(var key:String in aResponse)
			{
				chooseResponse(key,aResponse[key]);
			}	
		}
		
		private function chooseResponse(aType:String,aObject:Object):void
		{
			switch(aType)
			{
				case "localization":
					parseLocalization(aObject);
				break;
				
				case "levels":
					parseLevels(aObject);
				break;
				
				case "imgjsons":
					parseimgJSON(aObject);
				break;
			}
		}
		
		private function parseimgJSON(aObject:Object):void 
		{
			var spriteLoaders:Vector.<SpriteSheetLoader> = new Vector.<SpriteSheetLoader>();
			for each (var adressObj:Object in aObject)
			{
				var spriteLoader:SpriteSheetLoader = new SpriteSheetLoader(adressObj["adress"], Connections.instance.createRemoveInintFunction(adressObj["adress"]));
				Connections.instance.addInitItem(adressObj["adress"]);
				Connections.instance.addJSONRequest(spriteLoader);
			}	
			
		}
		
		private function parseLocalization(aObject:Object):void
		{
			StringRecources.instance.loadStrings(aObject);	
		}
		
		private function parseLevels(aObject:Object):void
		{
			Models.instance.levels.addElements(aObject);
			
		}
		
		
		
	}

}