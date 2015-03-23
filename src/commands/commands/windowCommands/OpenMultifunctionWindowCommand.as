package commands.commands.windowCommands 
{
	import commands.commands.BaseCommand;
	import windows.WindowController;
	/**
	 * ...
	 * @author l
	 */
	public class OpenMultifunctionWindowCommand extends BaseCommand
	{
		
		public function OpenMultifunctionWindowCommand() 
		{
			
		}
		
		override public function execute(aData:Object = null):void 
		{
			WindowController.instance.openMultiOptionWindow(aData["txtTitle"], aData["txtMessage"],aData["vecFunctions"],aData["vecBtnNames"]);
		}
		
	}

}