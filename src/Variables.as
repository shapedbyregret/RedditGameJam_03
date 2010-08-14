package  
{
	import flash.display.*;
	import flash.text.*;
	import flash.utils.Timer;
	import views.*;
	
	import de.polygonal.ds.*;
	
	public class Variables extends Sprite
	{
		
		public var paused:Boolean;
		public var timer:Timer;
		public var styles:StyleSheet;
		public var score:Number;
		public var numPlayers:int;
		public var vel:Number;
		
		// Containers
		public var colors:Array;
		public var players:DLL;
		public var bullets:DLL;
		public var enemies:DLL;
		public var particles:DLL;
		
		// Layers
		public var particleLayer:Sprite;
		public var enemyLayer:Sprite;
		public var playerLayer:Sprite;
		public var bulletLayer:Sprite;
		public var hud:Sprite;
		
		// Views
		public var titleScreen:Title;
		
		public function Variables()
		{
			paused = true;
			timer = new Timer(1000);
			styles = new StyleSheet();
			styles.parseCSS("h1{color:#222222;font-size:48px;}" +
							"h2{color:#222222;font-size:36px;}" +
							"h3{color:#123123;font-size:36px;}" +
							"h4{color:#222222;font-size:24px;}");
			score = 0;
			numPlayers = 0;
			vel = 2;
			
			//colors = [0xFF0000, 0xFFA500, 0xFFFF00, 0x008000, 0x0000FF, 0x4B0082, 0xEE82EE, 0x66a8e9, 0x579fe7, 0x4897e5];
			colors = [0xFF4500, 0xFF4500, 0xFF4500, 0xFF4500, 0xFF4500, 0xFF4500, 0xFF4500, 0xFF4500, 0xFF4500 , 0xFF4500];
			players = new DLL();
			bullets = new DLL();
			enemies = new DLL();
			particles = new DLL();
			
			particleLayer = new Sprite();
			enemyLayer = new Sprite();
			playerLayer = new Sprite();
			bulletLayer = new Sprite();
			hud = new Sprite();
			
			titleScreen = new Title();
		}
		
	}

}