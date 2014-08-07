package com.vektor.view.component
{
	import com.greensock.TweenLite;
	import com.greensock.easing.*;
	import com.greensock.plugins.*;
	import com.vektor.utility.Button;
	import com.vektor.utility.TextBuilder;
	
	import flash.display.Sprite;
	import flash.external.ExternalInterface;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.text.Font;
	import flash.text.TextField;
	
	import org.osflash.signals.Signal;
	
	public class Messages extends Sprite
	{
		public static const NAME:String							= 'Messages';
			
		private var dinLight:Font = new DIN_Light();
		private var dinMedium:Font = new DIN_Medium();
		
		private var titleArray:Array = ['ABOUT','SERVICES','MARKETS','CUSTOMERS','CAREERS','NEWS','BUILT ENVIRONMENT', 'IMPEC GROUP'];
		private var messageArray:Array = [
		'We look at every facilities challenge from the perspective of our customer, then deliver the right blend of integrated services and innovative solutions to meet their business and facility needs.  Our goal is 100% customer satisfaction on every account: we will settle for nothing less.',
		'Whether it’s qualifying and training your operations and maintenance personnel or designing facilities management strategies for your current or projected needs, our focus is always on how to drive down costs without compromising quality, comfort or safety.',
		'We understand and specialize in meeting the unique needs of our technology clients, whether it’s the regulatory complexity of Life Sciences, the clean room and data center challenges of our clean/high-tech clients, or the security and resource issues facing our Government and Education clients.',
		'At the core of every Impec engagement is the goal of total customer satisfaction.  Every one of our clients is referenceable, a claim that no other company can make and a source of huge pride to everyone at Impec.',
		'At the core of every successful engagement are our people. We attract, train and retain the finest people in the industry, creating a collaborative environment that rewards innovation, integrity and initiative. Our formula:  Challenge + Reward = Motivated Employees = High Customer Satisfaction.',
		'We’re a part of the emerging built environment market. Click here to see the events we’re participating in, recent news about Impec—even our opinions about the new challenges facing our industry.',
		'It’s the unique interplay of structure, energy, and technology, combined with the people and processes that run them.  We create innovative, comprehensive and integrated services that help our customers manage their complex built environment.',
		'By combining the best in people, process and technology, Impec delivers customized, innovative solutions for your built-environment needs.'];
		
		private var urlPrefix:String = 'http://www.impecgroup.com/';
		
		private var externalURL:Array = [urlPrefix + 'about',
										urlPrefix + 'services',
										urlPrefix + 'impec-group-markets',
										urlPrefix + 'impec-customers',
										urlPrefix + 'careers',
										urlPrefix + 'whats-new',
										urlPrefix + 'about',
										urlPrefix + 'about'];
		
		
		private var titleColorArray:Array = [0xF59229, 0X292160, 0X545454, 0x848588, 0x11043D, 0xD47805, 0x11043D, 0x11043D];
		private var spriteArray:Array = new Array();
		private var buttonArray:Array = new Array();
		private var items:Number = titleArray.length;
		private var index:Number = 0;

		public function Messages()
		{
			TweenPlugin.activate([TintPlugin]);
			
			for(var i:int = 0; i < items; i++)
			{
				var sp:Sprite = new Sprite();

//				CREATE TITLES
				TextBuilder.defineTextFormat(dinLight, 26, titleColorArray[i]);
				var tf:TextField = TextBuilder.makeTextField(titleArray[i], 330);
				sp.addChild(tf);
				
				var titleY:Number = tf.height - 5;
				
//				CREATE MESSAGES
				TextBuilder.defineTextFormat(dinLight, 16, 0x393739);
				var tf:TextField = TextBuilder.makeTextField(messageArray[i], 330);
				sp.addChild(tf);
				tf.y = titleY;
				
				var messageY:Number = titleY + tf.height;
				
//				CREATE BUTTONS
				TextBuilder.defineTextFormat(dinMedium, 18, 0xf59229);
				var tf:TextField = TextBuilder.makeTextField('LEARN MORE >', 150);
				var lm:Button = new Button(tf, 'learnmore_'+i, i);
				
				lm.enable();
				lm.y = messageY;
				lm.over.add(onButtonOver);
				lm.out.add(onButtonOut);
				lm.click.add(onButtonClick);
				sp.addChild(lm);
				buttonArray.push(lm);
				
				sp.visible = false;
				addChild(sp);
				sp.alpha = 0;
				spriteArray.push(sp);
			}
			fadeMessageIn(items-1);
		}
		
		private function onButtonOver(sp:Sprite, id:Number):void
		{
			TweenLite.to(buttonArray[id], .5, {tint:0x000000, ease:Expo.easeInOut});
		}
		
		private function onButtonOut(sp:Sprite, id:Number):void
		{
			TweenLite.to(buttonArray[id], .5, {tint:0xFFB100 ,ease:Expo.easeInOut});
		}
		
		private function onButtonClick(sp:Sprite, id:Number):void
		{
			var targetURL:URLRequest = new URLRequest( externalURL[id] );
    		navigateToURL(targetURL, "_self");
		}
		
		public function fadeMessageIn(id:Number):void
		{
			index = id;
			spriteArray[id].visible = true;
			buttonArray[id].visible = true;
			TweenLite.to(spriteArray[id], .3, {alpha:1, delay:.1, ease:Expo.easeIn});
		}
		
		public function fadeMessageOut(id:Number):void
		{
			TweenLite.to(spriteArray[id], .8, {alpha:0, ease:Expo.easeOut, onComplete:hideMessage});
		}
		
		private function hideMessage():void
		{
			for(var i:int = 0; i < spriteArray.length;i++)
			{
				if(index != i)
				{
					spriteArray[i].visible = false;
					buttonArray[i].visible = false;
				}
			}
		}
	}
}