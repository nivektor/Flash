package com.vektor.view.component
{
	import com.greensock.TweenLite;
	import com.greensock.easing.*;
	import com.greensock.plugins.*;
	import com.vektor.utility.Button;
	import flash.display.Sprite;
	import flash.events.*;
	import flash.utils.Timer;
	
	import org.osflash.signals.Signal;
	
	public class Cubes extends Sprite
	{
		private var base:BaseLayer = new BaseLayer();
		private var cubeAbout:CubeAbout = new CubeAbout();
		private var cubeAboutx:CubeAbout = new CubeAbout();
		private var cubeAbouty:CubeAbout = new CubeAbout();
		private var cubeAboutz:CubeAbout = new CubeAbout();
		private var cubeAboutOverlay:CubeAbout = new CubeAbout();
		
		private var cubeServices:CubeServices = new CubeServices();
		private var cubeServicesx:CubeServices = new CubeServices();
		private var cubeServicesy:CubeServices = new CubeServices();
		private var cubeServicesz:CubeServices = new CubeServices();
		private var cubeServicesOverlay:CubeServices = new CubeServices();
		
		private var cubeMarkets:CubeMarkets = new CubeMarkets();
		private var cubeMarketsx:CubeMarkets = new CubeMarkets();
		private var cubeMarketsy:CubeMarkets = new CubeMarkets();
		private var cubeMarketsz:CubeMarkets = new CubeMarkets();
		private var cubeMarketsOverlay:CubeMarkets = new CubeMarkets();
		
		private var cubeCustomers:CubeCustomers = new CubeCustomers();
		private var cubeCustomersx:CubeCustomers = new CubeCustomers();
		private var cubeCustomersy:CubeCustomers = new CubeCustomers();
		private var cubeCustomersz:CubeCustomers = new CubeCustomers();
		private var cubeCustomersOverlay:CubeCustomers = new CubeCustomers();
		
		private var cubeCareers:CubeCareers = new CubeCareers();
		private var cubeCareersx:CubeCareers = new CubeCareers();
		private var cubeCareersy:CubeCareers = new CubeCareers();
		private var cubeCareersz:CubeCareers = new CubeCareers();
		private var cubeCareersOverlay:CubeCareers = new CubeCareers();
		
		private var cubeNews:CubeNews = new CubeNews();
		private var cubeNewsx:CubeNews = new CubeNews();
		private var cubeNewsy:CubeNews = new CubeNews();
		private var cubeNewsz:CubeNews = new CubeNews();
		private var cubeNewsOverlay:CubeNews = new CubeNews();
		
		public var cthz:HotzoneAbout = new HotzoneAbout();
		public var cthz2:Hotzone = new Hotzone();
		public var cthz3:HotzoneSmall = new HotzoneSmall();
		public var cthz4:Hotzone = new Hotzone();
		public var cthz5:HotzoneSmall = new HotzoneSmall();
		public var cthz6:HotzoneNews = new HotzoneNews();
		
		public var button1:Button = new Button(cthz ,'button1', 0);
		public var button2:Button = new Button(cthz2 ,'button2', 1);
		public var button3:Button = new Button(cthz3 ,'button3', 2);
		public var button4:Button = new Button(cthz4 ,'button4', 3);
		public var button5:Button = new Button(cthz5 ,'button5', 4);
		public var button6:Button = new Button(cthz6 ,'button6', 5);
		
		public var cubeArray:Array = [cubeAbout, cubeServices, cubeMarkets, cubeCustomers, cubeCareers, cubeNews];
		public var cubeArray1:Array = [cubeAboutx, cubeServicesx, cubeMarketsx, cubeCustomersx, cubeCareersx, cubeNewsy];
		public var cubeArray2:Array = [cubeAbouty, cubeServicesy, cubeMarketsy, cubeCustomersy, cubeCareersy, cubeNewsy];
		public var cubeArray3:Array = [cubeAboutz, cubeServicesz, cubeMarketsz, cubeCustomersz, cubeCareersy, cubeNewsz];
		
		public var cubeOverlayArray:Array = [cubeAboutOverlay, cubeServicesOverlay, cubeMarketsOverlay, cubeCustomersOverlay,
												cubeCareersOverlay, cubeNewsOverlay];
												
		public var buttonArray:Array = [button1, button2, button3, button4, button5, button6];
		
		public var cubeStartLocationX:Array = [-156, -129, 585, 590 ,585, 735];
		public var cubeStartLocationY:Array = [-76, 292, -190,317, -190, 317];
		
		public var cubeEndLocationX:Array = [61, 136, 210, 285, 283, 358];
		public var cubeEndLocationY:Array = [67, 117, 68, 117, 20, 68];
		
		public var effectEndLocationX:Array = [25, 81, 285, 358, 344, 431];
		public var effectEndLocationY:Array = [43, 153, 19, 166, -21, 116];
		
		public var hotzoneX:Array = [61, 137, 214, 286, 287, 362];
		public var hotzoneY:Array = [67, 118, 70, 118, 21, 69];
		
		public var items:Number = cubeArray.length;
		
		public var overSignal:Signal = new Signal(Number);
		public var outSignal:Signal = new Signal(Number);
		public var introCompleteSignal:Signal = new Signal();
		
		private var autoPlayEnabled:Boolean = false;
		private var autoIndex:Number = 0;
		private var autoPlayTimer:Timer = new Timer(9500);
		private var currentIndex:Number = 0;
		private var firstPlay:Boolean = true;
		
		private var index:Number = 0;
		
		public function Cubes()
		{
			TweenPlugin.activate([GlowFilterPlugin]);
			
			addBase();
			addOverlay();
			addButtons();
			autoPlayTimer.addEventListener(TimerEvent.TIMER, autoPlayNext);
			startIntro();
		}
		
		private function startIntro():void
		{
			var d:Number = 0;
			for(var i:int = 0; i < items; i++)
			{
				if(i == 0)
				{
					d = .001
				}
				else
				{
					d = i;
				}
				TweenLite.to(cubeArray[i], 1, {x:cubeEndLocationX[i], y:cubeEndLocationY[i], delay:d*1, ease:Expo.easeInOut});
				TweenLite.to(cubeArray1[i], 1.05, {alpha:0, x:effectEndLocationX[i], y:effectEndLocationY[i], delay:d+.05, ease:Expo.easeInOut});
				TweenLite.to(cubeArray2[i], 1.1, {alpha:0, x:effectEndLocationX[i], y:effectEndLocationY[i], delay:d+.1, ease:Expo.easeInOut});
				TweenLite.to(cubeArray3[i], 1.15, {alpha:0, x:effectEndLocationX[i], y:effectEndLocationY[i], delay:d+.15, ease:Expo.easeInOut});
			}
			TweenLite.to(this, 0, {delay:items*1 + 2, onComplete:fadeOutIntro});
		}
		
		private function fadeOutIntro():void
		{
			addChildAt(base, 0);
			
			for(var i:int = 0; i < items; i++)
			{
				TweenLite.to(cubeArray[i], 1, {alpha:0});
				buttonArray[i].enable();
			}
			introCompleteSignal.dispatch();
			enableAutoPlay();
		}
		
		private function endIntro():void
		{
			introCompleteSignal.dispatch();
		}
		
		private function addBase():void
		{
			for(var i:int = 0; i < items; i++)
			{
				if(i == 2 || i == 4)
				{
					addChildAt(cubeArray3[i],0);
					addChildAt(cubeArray2[i],0);
					addChildAt(cubeArray1[i],0);
					addChildAt(cubeArray[i],0);
				}
				else
				{
					addChild(cubeArray3[i]);
					addChild(cubeArray2[i]);
					addChild(cubeArray1[i]);
					addChild(cubeArray[i]);
				}
				
				cubeArray[i].x = cubeStartLocationX[i];
				cubeArray[i].y = cubeStartLocationY[i];
				
				cubeArray1[i].x = cubeStartLocationX[i];
				cubeArray1[i].y = cubeStartLocationY[i];
				
				cubeArray2[i].x = cubeStartLocationX[i];
				cubeArray2[i].y = cubeStartLocationY[i];
				
				cubeArray3[i].x = cubeStartLocationX[i];
				cubeArray3[i].y = cubeStartLocationY[i];
			}
			
			setChildIndex(cubeNews, getChildIndex(cubeCustomers) - 1);
		}
		
		private function addOverlay():void
		{
			for(var i:int = 0; i < items; i++)
			{
				cubeOverlayArray[i].alpha = 0;
				
				addChild(cubeOverlayArray[i]);
				
				cubeOverlayArray[i].x = cubeEndLocationX[i];
				cubeOverlayArray[i].y = cubeEndLocationY[i];	
			}
						
			setChildIndex(cubeMarketsOverlay, getChildIndex(cubeCareersOverlay) + 1);
			setChildIndex(cubeCustomersOverlay, getChildIndex(cubeNewsOverlay) + 1);
			setChildIndex(cubeServicesOverlay, getChildIndex(cubeMarketsOverlay) + 1);
		}
		
		private function addButtons():void
		{
			for(var i:int = 0; i < items; i++)
			{
				buttonArray[i].alpha = 0;
				addChild(buttonArray[i]);
				buttonArray[i].x = hotzoneX[i];
				buttonArray[i].y = hotzoneY[i];
				
				buttonArray[i].over.add(onButtonOver);
				buttonArray[i].out.add(onButtonOut);
			}
		}
		
		public function enableAutoPlay():void
		{
			if(autoPlayEnabled == false)
			{
				setIndexing();
				
				for(var i:int = 0; i < items; i++)
				{
					buttonArray[i].enable();
					TweenLite.to(cubeOverlayArray[i], .5, {alpha:0, ease:Expo.easeInOut, onStart:dispatchSignalOut});
				}
				
				autoPlayEnabled = true;
				TweenLite.to(cubeOverlayArray[autoIndex], .5, {alpha:1, delay:.25, ease:Expo.easeInOut, onStart:dispatchSignalOver});
				autoPlayTimer.start();
			}
		}
		
		public function disableAutoPlay():void
		{
			autoPlayTimer.stop();
			autoPlayEnabled = false;
		}
		
		private function autoPlayNext(event:TimerEvent):void
		{
			if(autoIndex < items - 1)
			{
				setIndexing();
			
				TweenLite.to(cubeOverlayArray[currentIndex], .8, {alpha:0, ease:Expo.easeOut, onStart:dispatchSignalOut});
				TweenLite.to(cubeOverlayArray[autoIndex], .3, {alpha:1, ease:Expo.easeIn, delay:.25, onStart:dispatchSignalOver});
			}
			else // begin pseudo frame
			{
				trace('begin pseudo frame');
				currentIndex = items - 1;
				dispatchSignalOut();
				var d:Number = 0;
				
				for(var i:int = items - 1; i > -1; i--)
				{
					autoIndex = items;
					buttonArray[i].disable();
					
					TweenLite.to(cubeOverlayArray[i], 0, {glowFilter:{remove:true}});
					TweenLite.to(cubeOverlayArray[i], .3, {alpha:1, delay:d, ease:Expo.easeIn, onStart:dispatchSignalOver});
					d += .145;
				}
			}
			
		}
		
		private function dispatchSignalOver():void
		{
			overSignal.dispatch(autoIndex);
		}
		
		private function dispatchSignalOut():void
		{
			outSignal.dispatch(currentIndex);
		}
		
		private function onButtonOver(sp:Sprite, id:Number):void
		{
			outSignal.dispatch(items);
			for(var i:int = 0; i < items; i++)
			{
				if(i != id)
				{
					TweenLite.to(cubeOverlayArray[i], .3, {alpha:0, glowFilter:{remove:true}, ease:Expo.easeIn});
					
					outSignal.dispatch(i);
				}
				else
				{
					autoIndex = id;
				}
			}
			
			TweenLite.to(cubeOverlayArray[id], .8, {alpha:1, ease:Expo.easeOut, glowFilter:{color:0xf3efdf, alpha:1, strength:2.5, blurX:25, blurY:25} });
			
			overSignal.dispatch(id);
		}
		
		private function onButtonOut(sp:Sprite, id:Number):void
		{
		}
		
		private function setIndexing():void
		{
			if(firstPlay == true)
			{
				firstPlay = false;
			}
			else
			{
				currentIndex = autoIndex;
				if(autoIndex < items - 1)
				{
					autoIndex ++;
				}
				else
				{
					trace('SHOW ALL');
					autoIndex = 0;
				}
			}
			
		}
	}
}