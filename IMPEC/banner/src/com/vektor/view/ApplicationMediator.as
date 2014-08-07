package com.vektor.view
{
	import com.vektor.global.Notifications;
	import com.vektor.model.DataProxy;
	import com.vektor.view.component.Cubes;
	import com.vektor.view.component.Messages;
	import com.vektor.view.component.ActivityMonitor;
		
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class ApplicationMediator extends Mediator implements IMediator
	{
		public static const NAME:String							= 'ApplicationMediator';
		
		public function ApplicationMediator(viewComponent:Object=null)
		{
			super( NAME, viewComponent );
		}
		
		override public function onRegister():void
		{
			facade.registerMediator( new CubesMediator( viewComponent ) );
			facade.registerMediator( new MessagesMediator( viewComponent ) );
			facade.registerMediator( new ActivityMonitorMediator( viewComponent ) );
		}
		
		override public function listNotificationInterests():Array
		{
			return [
			];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			var name:String = notification.getName();
			var body:Object = notification.getBody();
		}
		
		private function get proxy():DataProxy
		{
			return facade.retrieveProxy( DataProxy.NAME ) as DataProxy;
		}
	}
}