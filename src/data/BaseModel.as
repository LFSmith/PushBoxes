package data 
{
	import adobe.utils.CustomActions;
	import flash.events.EventDispatcher;
	import flash.events.Event;
	/**
	 * ...
	 * @author l
	 */
	public class BaseModel extends EventDispatcher
	{
		private const changeevent:Event = new Event(Event.CHANGE);
		
		public function BaseModel() 
		{
			
		}
		
		public function importData(aData:Object):void
		{
			for (var key:String in aData)
			{
				if ( hasOwnProperty(key) )
				{
					switch( typeof(this[key]) )
					{
						case "string":
						{
							this[key] = String(aData[key]);
						}
						break;
						
						case "number":
						{
							this[key] = Number(aData[key]);
						}
						break;
						
						case "boolean":
						{
							this[key] = Boolean(aData[key]);
						}
						break;
						
						default:
						{
							
						}
						break;

					}
				}
			}
			notifyChanged();
		}
		
		
		
		private function notifyChanged():void
		{
			dispatchEvent(changeevent);
		}
		
	}

}