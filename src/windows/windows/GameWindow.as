package windows.windows 
{
	import caurina.transitions.Tweener;
	import commands.CommandExecuter;
	import data.LevelModel;
	import data.LocalSave;
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import pushBoxesGame.BasicGameFieldSprite;
	import pushBoxesGame.LevelParser;
	import resources.GraphicRecources;
	import resources.StringRecources;
	import utils.DisplayUtil;
	import windows.components.SideBar;
	import windows.components.Slider;
	import windows.WindowGraphics;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author l
	 */
	public class GameWindow extends BaseWindow
	{
		
		public function GameWindow() 
		{
			settingsSymbol.x = 7;
			
			
		}
		
		private var gField:BasicGameFieldSprite = new BasicGameFieldSprite();
		private var currentLevel:int = -1;
		private var soundSlider:Slider = new Slider(WindowGraphics.instance.createSymbol(WindowGraphics.SYMBOL_SOUND));
		private var musicSlider:Slider = new Slider(WindowGraphics.instance.createSymbol(WindowGraphics.SYMBOL_MUSIC));
		private var settingsSymbol:windows.components.SimpleButton = WindowGraphics.instance.createSymbolButton(WindowGraphics.SYMBOL_DELETE,settingsClicked);
		private var sideBar:SideBar = new SideBar(new<DisplayObject>[soundSlider,musicSlider,settingsSymbol]);
		private var reseter:Sprite = new Sprite();
		
	
		override public function create():void 
		{
			winHeight = 600;
			winWidth = 800;
			
			
			addChild(WindowGraphics.instance.createWindowBackground(winWidth, winHeight));
			addElements(new<DisplayObject>[gField],[5],true);
			gField.gameEndFunction = finishGame;
			addChild(sideBar);
			sideBar.x = (this.width -sideBar.width);
			sideBar.y  = (this.height - sideBar.height ) / 2;
			sideBar.expandedX = sideBar.x;
			var resetimg:DisplayObject = GraphicRecources.instance.createBitmap(GraphicRecources.IMG_REFRESH);
			reseter.addChild(resetimg);
			resetimg.x = resetimg.width / 2 * -1;
			resetimg.y = resetimg.height/2*-1
			reseter.x =resetimg.width/2;
			reseter.y = resetimg.height/2;
			reseter.addEventListener(MouseEvent.CLICK, onResetMouse);
			reseter.addEventListener(MouseEvent.ROLL_OVER, onResetMouse);
			reseter.addEventListener(MouseEvent.ROLL_OUT, onResetMouse);
			addChild(reseter);
			addChild(reseter);
			currentLevel = LocalSave.highestLevel;
			startLevel(currentLevel);
			soundSlider.updateFunction = changeSoundVolume;
			musicSlider.updateFunction = changeMusicVolume;
		}
		
		
		private function settingsClicked():void
		{
			CommandExecuter.instance.executeCommand(CommandExecuter.CLEAR_SAVEGAME_COMMAND);
			
			currentLevel = 0;
			startLevel(currentLevel);
		}
		private function changeSoundVolume():void
		{
			CommandExecuter.instance.executeCommand(CommandExecuter.SET_VOLUME, { eff_vol:soundSlider.sliderPercent } );
		}
		
		private function changeMusicVolume():void
		{
			CommandExecuter.instance.executeCommand(CommandExecuter.SET_VOLUME, { mus_vol:musicSlider.sliderPercent } );
		}
		
		private function onResetMouse(e:Event):void
		{
			switch(e.type)
			{
				case MouseEvent.ROLL_OUT:
					
					Tweener.addTween(reseter, {time:0.5,rotation:0} );
				break;
				
				case MouseEvent.ROLL_OVER:
					Tweener.addTween(reseter, {time:0.5,rotation:45} );
				break;
				
			case MouseEvent.CLICK:
				startLevel(currentLevel);
				break;
				
				default:
				break;
			}
		}
		private function finishGame():void
		{
			CommandExecuter.instance.executeCommand(CommandExecuter.OPEN_INFO_WINDOW, { txtTitle:"Game Complete", txtMessage:StringRecources.instance.getString("level_complete") } );
			startNextRound();
			LocalSave.addCompletedLevel(currentLevel);
		}
		
		private function startNextRound():void 
		{
			incrementLevel();
			startLevel(currentLevel);
			
		}
		private function startLevel(aLevel:Number):void
		{
			gField.SetupField(aLevel);
			gField.x = (windowWidth / 2)-(gField.width/2);
			gField.y = (windowHeight / 2)-(gField.height/2);
		}
		
		

		private function incrementLevel():void
		{
			currentLevel++;
			if (!(currentLevel < LevelParser.totalLevels))
			{
				currentLevel = 0;
			}
			
		}
		
		private function decrementLevel():void
		{
			currentLevel--;
			if (currentLevel < 0)
			{
				currentLevel = LevelParser.totalLevels-1;
			}
			
		}
	
	
		
	}

}