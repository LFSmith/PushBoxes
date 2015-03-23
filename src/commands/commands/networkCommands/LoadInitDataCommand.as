package commands.commands.networkCommands 
{
	import commands.commands.BaseCommand;
	import connection.Connections;
	/**
	 * ...
	 * @author l
	 */
	public class LoadInitDataCommand extends BaseCommand
	{
		
		public function LoadInitDataCommand() 
		{
			
		}
		override public function execute(aData:Object = null):void 
		{
			Connections.instance.initload(aData["completeFunction"]);
		}
		
	}

}