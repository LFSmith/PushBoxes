package commands.commands.macroCommands 
{
	import commands.commands.BaseCommand;
	/**
	 * ...
	 * @author l
	 */
	public class BaseMacroCommad extends BaseCommand
	{
		
		public function BaseMacroCommad() 
		{
			
		}
		
		
		protected var arrCommandClasses:Array = [];
		
		override public function execute(aData:Object = null):void 
		{
			for each(var CommandClass:Class in arrCommandClasses)
			{
				var command:BaseCommand = new CommandClass();
				command.execute(aData);
			}
			
		}
		
	}

}