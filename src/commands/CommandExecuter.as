package commands 
{
	import commands.commands.macroCommands.*;
	import commands.commands.miscCommands.*
	import commands.commands.macroCommands.*
	import commands.commands.windowCommands.*;
	import commands.commands.networkCommands.*;
	import flash.utils.getQualifiedClassName;
	import flash.utils.describeType;
	/**
	 * ...
	 * @author l
	 */
	public class CommandExecuter 
	{
		
		public static const INIT_DATA_COMMAND:String = "init_data_command";
		public static const INIT_APPLICATION_MACRO_COMMAND:String = "init_application_macro";
		public static const OPEN_INFO_WINDOW:String = "open_info_window"
		public static const OPEN_MULTIFUNCTION_WINDOW:String = "open_multifunction_window";
		public static const CLOSE_ALL_WINDOWS:String = "close_all_windows";
		public static const CLOSE_TOP_WINDOW:String = "close_top_window";
		public static const CLEAR_SAVEGAME_COMMAND:String = "clear_savegame_command";
		public static const SET_VOLUME:String = "set_volume_command";

		private static var _instance:CommandExecuter ;
		private var vecCommandNamePairs:Vector.<CommandNamePair> = new Vector.<CommandNamePair>();
		
		public function CommandExecuter ()
		{
			if (_instance != null)
			{
				throw new Error("Class is singleton use instance");
			} 
			_instance = this;
		}
		
		public static function get instance():CommandExecuter 
		{
			if (!_instance)
			{
				new CommandExecuter();
				_instance.Init();
			} 
			return _instance;
		}
		
		public function registerCommand(aName:String,aClass:Class):void
		{
			var typeXML:XML = describeType(aClass);
			if(typeXML.factory.extendsClass.(@type=="commands.commands::BaseCommand").length() == 0)
			{
				return;
			}
			
			for each(var pair:CommandNamePair in vecCommandNamePairs)
			{
				if (getQualifiedClassName( pair.commandClass) == getQualifiedClassName(aClass) )
				{
					return;
				}
			}
			
			vecCommandNamePairs.push( new CommandNamePair(aClass,aName) );
		}
		
		public function removeCommand(aName:String,aClass:Class):void
		{
			for each(var pair:CommandNamePair in vecCommandNamePairs)
			{
				if (getQualifiedClassName( pair.commandClass) == getQualifiedClassName(aClass) )
				{
					
					vecCommandNamePairs.splice(vecCommandNamePairs.indexOf(pair), 1);
					return;
				}
			}

		}
		
		public function executeCommand(aCommandName:String,aData:Object = null):void
		{
			for each(var pair:CommandNamePair in vecCommandNamePairs)
			{
				pair.executeIfMatch(aCommandName,aData);
			}
			
		}
		
		private function Init():void
		{
			registerCommand(CLEAR_SAVEGAME_COMMAND, ClearSavegameCommand);
			registerCommand(INIT_DATA_COMMAND,LoadInitDataCommand);
			registerCommand(INIT_APPLICATION_MACRO_COMMAND, InitApplicationMacro);
			registerCommand(CLOSE_ALL_WINDOWS, CloseAllWindowsCommand);
			registerCommand(CLOSE_TOP_WINDOW, CloseTopWindowCommand);
			registerCommand(OPEN_INFO_WINDOW,OpenInfoWindowCommand);
			registerCommand(OPEN_MULTIFUNCTION_WINDOW, OpenMultifunctionWindowCommand);
			registerCommand(SET_VOLUME, SetVolumeCommand);
		}
		
	}

}