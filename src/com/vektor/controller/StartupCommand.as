package com.vektor.controller
{
//	import com.vektorModule;
	import com.vektor.view.ApplicationMediator;
//	import com.vektor.pipes.MainJunctionMediator;
	import com.vektor.model.DataProxy;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class StartupCommand extends SimpleCommand implements ICommand
	{
		override public function execute(notification:INotification):void
		{
			facade.registerProxy( new DataProxy( ) );
			facade.registerMediator( new ApplicationMediator( notification.getBody() ) );	
		}
	}
}