package resources 
{
	/**
	 * ...
	 * @author l
	 */
	
		
		import adobe.utils.CustomActions;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.utils.IExternalizable;
	
	/**
	 * ...
	 * @author l
	 */
	public class SoundRecources  
	{
		public static const CLICK:uint = 0;
		public static const CLUNK:uint = 1;	
		
		private static var _instance:SoundRecources  ;
		
		public function SoundRecources ()
		{
			if (_instance != null)
			{
				throw new Error("Class is singleton use instance");
			} 
			_instance = this;
		}
		
		[Embed(source="../../lib/sounds/boss.mp3")]
		private var themeClass:Class;
		[Embed(source="../../lib/sounds/klunk.mp3")]
		private var klunkClass:Class;
		private var effectClasses:Array = [klunkClass];
		private var themeTrans:SoundTransform = new SoundTransform();
		private var effectTrans:SoundTransform = new SoundTransform();
		private var sndTheme:Sound = new themeClass();
		private var playTheme:Boolean = false;
		
		private var chnl:SoundChannel = new SoundChannel();
		
		public static function get instance():SoundRecources  
		{
			if (!_instance)
			{
				new SoundRecources();
			}
			return _instance;
		}
		
		public function set effectVol(aNumber:Number):void
		{
			effectTrans.volume = aNumber;
			
		}
		public function set themevol(aNumber:Number):void
		{
			themeTrans.volume = aNumber;
			chnl.soundTransform = themeTrans;
		}
		
		public function playeffect(aEffectID:uint):void
		{
			if (aEffectID < effectClasses.length)
			{
				var snd_eff:Sound = new  effectClasses[aEffectID]();
				snd_eff.play(0,0,effectTrans);
			}			
		}
		
		public function Toogletheme():void
		{
			if (playTheme)
			{
				chnl.stop();
				
			}else
			{
				chnl = sndTheme.play(0,0,themeTrans);
				chnl.addEventListener(Event.SOUND_COMPLETE, onComplete);
				playTheme = !playTheme;
			}
		}
		
		private function onComplete(e:Event):void 
		{
			chnl.removeEventListener(Event.SOUND_COMPLETE, onComplete);
			chnl = sndTheme.play(0,0,themeTrans);
			chnl.addEventListener(Event.SOUND_COMPLETE, onComplete, false, 0, true);
		}
		
	}

}
	

