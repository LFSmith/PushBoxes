package 
{	import flash.display.Sprite
	import commands.CommandExecuter;
	import connection.Connections;
	import data.BaseModel;
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.events.Event
	import pushBoxesGame.PushBoxGraphics;
	import resources.GraphicRecource;
	import resources.GraphicRecources;
	import resources.SoundRecources;
	import resources.StringRecources;
	import utils.KeyboardEventUtil;
	import visual.AniSprite;
	import windows.WindowGraphics;
	
	
	/**
	 * ...
	 * @author l
	 */
	public class Main extends Sprite 
	{
		public static var StageRef:Stage;
		
		public function Main():void 
		{
			if (stage)
			{
				init();
			}
			else
			{
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		
		private var loadScreen:LoadSprite = new LoadSprite();
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
		//	addChild(loadScreen);
			StageRef = this.stage;
			CommandExecuter.instance.executeCommand(CommandExecuter.INIT_DATA_COMMAND,{completeFunction:initApplication});
		}
		
		private function initApplication():void
		{
			//removeChild(loadScreen);
			KeyboardEventUtil.instance.init(this.stage);
			CommandExecuter.instance.executeCommand(CommandExecuter.INIT_APPLICATION_MACRO_COMMAND, { windowplane:this.stage } );

		}	
		

		
		
	}
	
}