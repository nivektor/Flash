package com.vektor
{
	import com.vektor.global.Notifications;
	import com.vektor.controller.*;
	
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;
	import org.puremvc.as3.patterns.observer.Notification;
	
	public class ApplicationFacade extends Facade implements IFacade
	{	
		public static function getInstance():ApplicationFacade
		{
			return (instance ? instance : new ApplicationFacade()) as ApplicationFacade;
		}
		
		override protected function initializeController():void
		{
			super.initializeController();
			
			registerCommand( Notifications.STARTUP, StartupCommand );
		}
		
		public function startup(stage:Object):void
		{
			sendNotification( Notifications.STARTUP, stage );
		}
		
		override public function sendNotification(notificationName:String, body:Object=null, type:String=null):void
		{
//			trace( 'NOTIFICATION!======] ' + notificationName + ' [======  '/* + body*/ );
			notifyObservers( new Notification( notificationName, body, type ) );
		}
	}
}