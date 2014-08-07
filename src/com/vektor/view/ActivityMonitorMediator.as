package com.vektor.view
{
	import com.vektor.global.Notifications;
	import com.vektor.model.DataProxy;
	import com.vektor.view.component.ActivityMonitor;
	
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class ActivityMonitorMediator extends Mediator implements IMediator
	{
		public static const NAME:String							= 'ActivityMonitorMediator';
		
		private var activity:ActivityMonitor;
		
		public function ActivityMonitorMediator(viewComponent:Object=null)
		{
			super( NAME, viewComponent );
		}
		
		override public function onRegister():void
		{
			activity = new ActivityMonitor();
			viewComponent.addChild(activity);
			activity.activeSignal.add(onActivity);
			activity.inactiveSignal.add(onInactivity);
		}
		
		override public function listNotificationInterests():Array
		{
			return [
				Notifications.ENABLE_ACTIVITY_MONITOR
			];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			var name:String = notification.getName();
			var body:Object = notification.getBody();
			
			switch ( name )
			{
				case Notifications.ENABLE_ACTIVITY_MONITOR:
				activity.enble();
				break;
			}
		}
		
		private function onActivity():void
		{
			sendNotification(Notifications.ACTIVE);
		}
		
		private function onInactivity():void
		{
			sendNotification(Notifications.INACTIVE);
		}
		
		private function get proxy():DataProxy
		{
			return facade.retrieveProxy( DataProxy.NAME ) as DataProxy;
		}
	}
}