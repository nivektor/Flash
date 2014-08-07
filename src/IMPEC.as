package
{
	import com.vektor.ApplicationFacade;
	
	import flash.display.Sprite;

	[SWF(width="911", height="313", frameRate="36", backgroundColor="0xFFFFFF")]
	public class IMPEC extends Sprite
	{
		public function IMPEC()
		{
			init();
		}

		private function init():void
		{
			ApplicationFacade.getInstance().startup( this );
		}
	}
}