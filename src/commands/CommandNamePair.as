package commands 
{
	import commands.commands.BaseCommand;
	/**
	 * ...
	 * @author l
	 */
	public class CommandNamePair 
	{
		
		public function CommandNamePair(aCommand:Class,aCommandName:String) 
		{
			_commandClass = aCommand;
			_commandName = aCommandName;
		}
		
		private var _commandClass:Class;
		private var _commandName:String;
		
		public function get commandName():String
		{
			return _commandName;
		}
		
		public function get commandClass():Class
		{
			return _commandClass;
		}
		
		public function executeIfMatch(aName:String,aData:Object):void
		{
			if (aName == _commandName)
			{
				if (aData == null)
				{
					aData = { };
				}
				new (_commandClass)().execute(aData);
			}	
		}
		
	}

}