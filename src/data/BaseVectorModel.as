package data 
{
	import adobe.utils.CustomActions;
	/**
	 * ...
	 * @author l
	 */
	public class BaseVectorModel extends BaseModel
	{
		
		public function BaseVectorModel(aClass:Class) 
		{
			_class = aClass;
			
		}
		
		private var _vector:Vector.<BaseModel> = new Vector.<BaseModel>();
		private var _class:Class = BaseModel;
		
		override public function importData(aData:Object):void 
		{
			removeAllElements();
			addElements(aData);
		}
		
		public function get elements(): Vector.<BaseModel>
		{
			return _vector;
		}
		
		public function addElement(aData:Object):void
		{
			var newElement:BaseModel = new _class();
			newElement.importData(aData);
			_vector.push(newElement);
		}
		
		public function addElements(aData:Object):void
		{
			for each(var obj:Object in aData)
			{
				addElement(obj);
			}
			
		}
		
		public function removeAllElements():void
		{
			_vector = new Vector.<BaseModel>();
		}
	}

}