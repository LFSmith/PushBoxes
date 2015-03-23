package data 
{
	import flash.net.SharedObject;
	/**
	 * ...
	 * @author l
	 */
	public class LocalSave 
	{
		private static const SAVEOBJECTNAME:String= "pushboxes_smith-it.net"
		public function LocalSave() 
		{
			
		}
		
		public static function addCompletedLevel(aLevel:Number):void
		{
			var saveDataObject:SharedObject = SharedObject.getLocal(SAVEOBJECTNAME);
			var levelArray:Array = saveDataObject.data["levelArray"];
			if (levelArray == null)
			{
				levelArray = new Array();
			}
			for each (var savedLevel:Number in levelArray)
			{
				if (savedLevel == aLevel)
				{
					return;
				}
			}

			levelArray.push(aLevel);
			saveDataObject.data["levelArray"] = levelArray;
			saveDataObject.flush();
		}
		
		public static function get completedLevels():Array
		{
			var saveDataObject:SharedObject = SharedObject.getLocal(SAVEOBJECTNAME);
			var levelArray:Array = saveDataObject.data["levelArray"];
			if (levelArray != null)
			{
				return levelArray;
			}
			return [];
		}
		
		public static function get highestLevel():int
		{
			var saveDataObject:SharedObject = SharedObject.getLocal(SAVEOBJECTNAME);
			var levelArray:Array = saveDataObject.data["levelArray"];
			var maxLevel:int = 0;
			if (levelArray != null)
			{
				for each(var checkLevel:int in levelArray)
				{
					if (checkLevel > maxLevel)
					{
						maxLevel = checkLevel;
					}
				}
			}
			return maxLevel;
			
		}
		
		public static function clearLevels():void
		{
			var saveDataObject:SharedObject = SharedObject.getLocal(SAVEOBJECTNAME);
			saveDataObject.clear();
			saveDataObject.flush();
			
		}
		
	}

}