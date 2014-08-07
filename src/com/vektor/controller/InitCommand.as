package com.vektor.controller
{
	import com.vektor.global.Notifications;
	import com.vektor.model.DataProxy;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class InitCommand extends SimpleCommand implements ICommand
	{
		override public function execute(notification:INotification):void
		{
		}
	}
}