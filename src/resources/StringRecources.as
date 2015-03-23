package resources 
{
	/**
	 * ...
	 * @author l
	 */
	public class StringRecources 
	{
		
		private static var _instance:StringRecources;
		
		public function StringRecources  ()
		{
			if (_instance != null)
			{
				throw new Error("Class is singleton use instance");
			} 
			_instance = this;
		}
		
		private var _language:String = "en";
		private var languageObjs:Array = [];
		
		public static function get instance():StringRecources 
		{
			if (!_instance)
			{
				new StringRecources();
			}
			return _instance;
			
		}
	
		
		public function set language(aValue:String):void
		{
			_language = aValue;
		}
		public function loadStrings(aObject:Object):void
		{
			languageObjs.push(aObject);
		}
		public function getString(aID:String):String
		{
			for each(var lObj:Object in languageObjs)
			{
				if (lObj.language == _language)
				{
					for each(var strObj:Object in lObj["strings"])
					{
						if (strObj["id"] == aID)
						{
							return strObj["text"]
						}
					}
				}
			}
			
			return "string: " + aID + " not found";
			
		}
		
	}
	


}