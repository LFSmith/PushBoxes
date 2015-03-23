package commands.commands.miscCommands 
{
	import commands.commands.BaseCommand;
	import resources.SoundRecources;
	/**
	 * ...
	 * @author l
	 */
	public class SetVolumeCommand extends BaseCommand
	{
		
		public function SetVolumeCommand() 
		{
			
		}
		override public function execute(aData:Object = null):void 
		{
			if (aData["mus_vol"] != null)
			{
				SoundRecources.instance.themevol = aData["mus_vol"];
			}
			
			if(aData["eff_vol"]!=null)
			{
				SoundRecources.instance.effectVol =aData["eff_vol"];
			}
			
		}
		
	}

}