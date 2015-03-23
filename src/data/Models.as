package data 
{
	/**
	 * ...
	 * @author l
	 */
	public class Models 
	{
		
		private static var _instance:Models ;
		
		public function Models ()
		{
			if (_instance != null)
			{
				throw new Error("Class is singleton use instance");
			} 
			_instance = this;
		}

		public static function get instance():Models 
		{
			if (!_instance)
			{
				new Models();
			} 
			return _instance;
		}
		
		public var levels:BaseVectorModel = new BaseVectorModel(LevelModel);
		
		
	}

}