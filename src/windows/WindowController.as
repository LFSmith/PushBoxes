package windows 
{
	import flash.display.ActionScriptVersion;
	import flash.display.DisplayObjectContainer;
	import flash.display.Shape;
	import flash.display.Stage;
	import windows.windows.BaseWindow;
	import windows.windows.GameWindow;
	import windows.windows.InfoWindow;
	import windows.windows.MultiOptionWindow;
	/**
	 * ...
	 * @author l
	 */
	public class WindowController 
	{
		
		
		private static var _instance:WindowController;
		private var _windowPlane:Stage;
		private var _vecWindows:Vector.<BaseWindow> = new Vector.<BaseWindow>();
		
		public function WindowController()
		{
			if (_instance != null)
			{
				throw new Error("Class is singleton use instance");
			} 
			_instance = this;
		}

		public static function get instance():WindowController
		{
			if (!_instance)
			{
				new WindowController();
			} 
			return _instance;
		}
		
		public function set windowPlane(value:Stage):void
		{
			_windowPlane = value;
		}
		
		
	
		public function closeTopWindow():void
		{
			if (_vecWindows.length > 0)
			{
				closeWindow(_vecWindows[_vecWindows.length-1]);
			}
		}
		
		public function closeAllWindows():void
		{
			for each( var Window:BaseWindow in _vecWindows)
			{
				closeWindow(Window);
			}
		}
		
		
		public function openMultiOptionWindow(aTitle:String, aMessage:String, aFunctions:Vector.<Function>,aBtnNames:Vector.<String>):void
		{
			var multiOptionwindow:MultiOptionWindow = new MultiOptionWindow();
			multiOptionwindow.setOptions(aTitle, aMessage, aFunctions, aBtnNames);
			addWindow(multiOptionwindow);
			
			
		}
		
		public function openInfoWindow(aTitle:String,aInfoText:String):void
		{
			var infoWindow:InfoWindow = new InfoWindow();
			infoWindow.setMessage(aTitle, aInfoText);
			addWindow(infoWindow);
			
		}
		
		public function openGameWindow():void
		{
			addWindow(new GameWindow());
		}
		
		private function centerWindowVertical(aWindow:BaseWindow):void
		{
			
			aWindow.x = (_windowPlane.stageWidth - aWindow.windowWidth) / 2;
		}
		
		private function centerWindowHorizontel(aWindow:BaseWindow):void
		{
			aWindow.y = (_windowPlane.stageHeight - aWindow.windowHeight) / 2;
		}
		
		private function addWindow(aWindow:BaseWindow,aAddBackplane:Boolean=true):void
		{
			var winPos:int = _vecWindows.indexOf(aWindow); 
			
			if(winPos > -1)
			{
				_vecWindows.splice(winPos,1); 
			}else
			{
				aWindow.create();
			}
			
			_vecWindows.push(aWindow);
			centerWindowHorizontel(aWindow);
			centerWindowVertical(aWindow);
			if (aAddBackplane)
			{
				addWindowBackplanel(aWindow);
			}
			_windowPlane.addChild(aWindow);	
		}
		
	
		public function closeWindow(aWindow:BaseWindow):void
		{
			var winPos:int = _vecWindows.indexOf(aWindow);
			aWindow.prepareClose();
			if (aWindow.parent != null)
			{
				aWindow.parent.removeChild(aWindow);
			}
			if (winPos > -1)
			{
				_vecWindows.splice(winPos, 1);
			}
		}
		
		private function addWindowBackplanel(aWin:BaseWindow):void
		{
			var backPanel:Shape = new Shape();
			backPanel.graphics.beginFill(0xCCCCCC                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ,0.5);
			backPanel.graphics.drawRect(-1*aWin.x, -1*aWin.y, _windowPlane.width, _windowPlane.height);
			aWin.addChildAt(backPanel, 0);
		}

		

		
		
	}

}