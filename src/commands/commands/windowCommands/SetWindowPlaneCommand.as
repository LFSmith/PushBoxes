package commands.commands.windowCommands 
{
	import commands.commands.BaseCommand;
	import windows.WindowController;
	/**
	 * ...
	 * @author l
	 */
	public class SetWindowPlaneCommand extends BaseCommand
	{
		
		public function SetWindowPlaneCommand() 
		{
			
		}
		
		override public function execute(aData:Object = null):void 
		{
			WindowController.instance.windowPlane = aData["windowplane"];
		}
		
	}

}