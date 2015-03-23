package commands.commands.windowCommands 
{
	import commands.commands.BaseCommand;
	import windows.WindowController;
	/**
	 * ...
	 * @author l
	 */
	public class CloseTopWindowCommand extends BaseCommand
	{
		
		public function CloseTopWindowCommand() 
		{
			
		}
		
		override public function execute(aData:Object = null):void 
		{
			WindowController.instance.closeTopWindow();
		}
		
	}

}