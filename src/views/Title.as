package views 
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	

	public class Title extends Sprite
	{
		private var styles:StyleSheet;
		
		public function Title()
		{
			styles = new StyleSheet();
			styles.parseCSS("h1{color:#FF4500;font-size:24px;}" +
							"h2{color:#222222;font-size:18px;}" +
							"h3{color:#C320C3;font-size:18px;}" +
							"h4{color:#222222;font-size:14px;}");
			
			/*graphics.beginFill(0x111111, 0.9);
			graphics.drawRect(0, 0, 640, 480);
			graphics.endFill();*/
			
			var title:TextField = tfHelper(150, 40);
			title.htmlText = "<font face='TexGyreHeros'><h1>Follow Flow Wolf Waffle</h1></font>";
			addChild(title);
			
			var playTxt:TextField = tfHelper(0, 0);
			playTxt.htmlText = "<font face='TexGyreHeros'><h2>Play</h2></font>";
			var playTxtHover:TextField = tfHelper(0, 0);
			playTxtHover.htmlText = "<font face='TexGyreHeros'><h3>Play</h3></font>";
			var playBut:SimpleButton = new SimpleButton(playTxt, playTxtHover, playTxtHover, playTxtHover);
			playBut.x = 150;
			playBut.y = 200;
			addEventListener(MouseEvent.CLICK, playGame);
			addChild(playBut);
		}
		
		public function toggleVisibility():void
		{
			visible = !visible;
		}
		
		private function playGame(me:MouseEvent = null):void
		{
			new GoodGuy();
			
			Main.g.paused = false;
			Main.g.timer.start();
			toggleVisibility();
		}
		
		private function tfHelper(newX:Number, newY:Number):TextField
		{
			var tf:TextField = new TextField();
			tf.selectable = false;
			tf.styleSheet = styles;
			tf.embedFonts = true;
			tf.autoSize = TextFieldAutoSize.CENTER;
			tf.x = newX;
			tf.y = newY;
			
			return tf;
		}
	}

}