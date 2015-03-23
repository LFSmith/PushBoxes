package commands.commands.windowCommands 
{
	import commands.commands.BaseCommand;
	import windows.WindowController;
	/**
	 * ...
	 * @author l
	 */
	public class OpenGameWindowCommad extends BaseCommand
	{
		
		public function OpenGameWindowCommad() 
		{
			
		}
		
		override public function execute(aData:Object = null):void 
		{
			WindowController.instance.openGameWindow();
		}
		
	}

}