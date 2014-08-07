package com.vektor.view
{
	import com.vektor.global.Notifications;
	import com.vektor.model.DataProxy;
	import com.vektor.view.component.Cubes;
	
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class CubesMediator extends Mediator implements IMediator
	{
		public static const NAME:String							= 'CubesMediator';
		
		private var cubes:Cubes;
		
		public function CubesMediator(viewComponent:Object=null)
		{
			super( NAME, viewComponent );
		}
		
		override public function onRegister():void
		{
			cubes = new Cubes();
			viewComponent.addChild( cubes );
			
			cubes.overSignal.add(onButtonOver);
			cubes.outSignal.add(onButtonOut);
			cubes.introCompleteSignal.add(onIntroComplete);
		}
		
		override public function listNotificationInterests():Array
		{
			return [
				Notifications.ACTIVE,
				Notifications.INACTIVE
			];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			var name:String = notification.getName();
			var body:Object = notification.getBody();
			
			switch ( name )
			{
				case Notifications.INACTIVE:
				trace('GO!');
				cubes.enableAutoPlay();
				break;
				
				case Notifications.ACTIVE:
				cubes.disableAutoPlay();
				trace('STOP!');
				break;
			}
		}
		
		private function onButtonOver(id:Number):void
		{
			sendNotification(Notifications.CUBE_OVER, id);
		}
		
		private function onButtonOut(id:Number):void
		{
			sendNotification(Notifications.CUBE_OUT, id);		
		}
		
		private function onIntroComplete():void
		{
			sendNotification(Notifications.ENABLE_ACTIVITY_MONITOR);
		}
		
		private function get proxy():DataProxy
		{
			return facade.retrieveProxy( DataProxy.NAME ) as DataProxy;
		}
	}
}