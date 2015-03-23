package commands.commands.miscCommands 
{
	import commands.commands.BaseCommand;
	import data.LocalSave;
	import resources.StringRecources;
	import windows.WindowController;
	/**
	 * ...
	 * @author l
	 */
	public class ClearSavegameCommand extends BaseCommand
	{
		
		public function ClearSavegameCommand() 
		{
			WindowController.instance.openMultiOptionWindow(StringRecources.instance.getString("warning"), StringRecources.instance.getString("clearsavegame_msg"), new < Function > [clearSavegame, dontClearSaveGame], new < String > [StringRecources.instance.getString("yes"), StringRecources.instance.getString("no")]);
			
		}
		
		private function clearSavegame():void
		{
			LocalSave.clearLevels();
			
		}
		
		private function dontClearSaveGame():void
		{
			
		}
		
	}

}