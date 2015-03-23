package commands.commands.windowCommands 
{
	import commands.commands.BaseCommand;
	import pushBoxesGame.BasicGameFieldSprite;
	import windows.WindowController;
	/**
	 * ...
	 * @author l
	 */
	public class CloseAllWindowsCommand extends BaseCommand
	{
		
		public function CloseAllWindowsCommand() 
		{
			
		}
		override public function execute(aData:Object = null):void 
		{
			WindowController.instance.closeAllWindows();
		}
		
	}

}