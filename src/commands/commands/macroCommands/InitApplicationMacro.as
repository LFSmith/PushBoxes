package commands.commands.macroCommands 
{
	import commands.commands.networkCommands.LoadInitDataCommand;
	import commands.commands.windowCommands.OpenGameWindowCommad;
	import commands.commands.windowCommands.SetWindowPlaneCommand;
	/**
	 * ...
	 * @author l
	 */
	public class InitApplicationMacro extends BaseMacroCommad
	{
		
		public function InitApplicationMacro() 
		{
			arrCommandClasses = [SetWindowPlaneCommand,OpenGameWindowCommad];
			
		}
		
		
		
	}

}