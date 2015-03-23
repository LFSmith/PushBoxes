package utils 
{
	import flash.display.DisplayObject;
	/**
	 * ...
	 * @author l
	 */
	public class DisplayUtil 
	{
		
		public function DisplayUtil() 
		{
			throw(new Error("Class is not ment to be instanciated"));
		}
		
		public static function centerInParent(aCenterObj:DisplayObject):void
		{
			if (aCenterObj.parent == null)
			{
				return;
			}
			aCenterObj.x = (aCenterObj.parent.width - aCenterObj.width) / 2;
			aCenterObj.y = (aCenterObj.parent.height - aCenterObj.height) / 2;
		}
		
	}

}