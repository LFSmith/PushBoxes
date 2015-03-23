package commands.commands.windowCommands 
{
	import commands.commands.BaseCommand;
	import windows.WindowController;
	/**
	 * ...
	 * @author l
	 */
	public class OpenInfoWindowCommand extends BaseCommand
	{
		
		public function OpenInfoWindowCommand() 
		{
			
		}
		
		override public function execute(aData:Object = null):void 
		{
			WindowController.instance.openInfoWindow(aData["txtTitle"], aData["txtMessage"]);
		}
		
	}

}