package com.vektor.model
{
	import com.vektor.global.Notifications;
	import com.vektor.model.vo.DataVO;
	
	//import com.vektor.utility.XMLParser;

	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;

	public class DataProxy extends Proxy implements IProxy
	{	
		public static const NAME:String							= 'DataProxy';
				
		public function DataProxy()
		{
			super( NAME, new DataVO() );
		}
		
		public function setImageClips(arr:Array):void
		{
			vo.imageClips = arr;
		}

		public function get vo():DataVO
		{
			return data as DataVO;
		}
	}
}