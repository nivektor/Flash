package com.vektor.view
{
	import com.vektor.global.Notifications;
	import com.vektor.model.DataProxy;
	import com.vektor.view.component.Messages;
	
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class MessagesMediator extends Mediator implements IMediator
	{
		public static const NAME:String							= 'MessagesMediator';
		
		private var messages:Messages;
		
		public function MessagesMediator(viewComponent:Object=null)
		{
			super( NAME, viewComponent );
		}
		
		override public function onRegister():void
		{
			messages = new Messages();
			messages.x = 570;
			messages.y = 65;
			viewComponent.addChild( messages );
			
		}
		
		override public function listNotificationInterests():Array
		{
			return [
				Notifications.CUBE_OVER,
				Notifications.CUBE_OUT,
				Notifications.ENABLE_ACTIVITY_MONITOR
			];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			var name:String = notification.getName();
			var body:Object = notification.getBody();
			
			switch ( name )
			{
				case Notifications.CUBE_OVER:
				messages.fadeMessageIn(body as Number);
				break;
				
				case Notifications.CUBE_OUT:
				messages.fadeMessageOut(body as Number);
				break;
				
				case Notifications.ENABLE_ACTIVITY_MONITOR:
				messages.fadeMessageOut(7);
				break;
			}
		}
		
		private function get proxy():DataProxy
		{
			return facade.retrieveProxy( DataProxy.NAME ) as DataProxy;
		}
	}
}