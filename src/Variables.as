package  
{
	import flash.display.*;
	import de.polygonal.ds.*;
	
	public class Variables extends Sprite
	{
		
		public var paused:Boolean;
		
		public var colors:Array;
		public var players:DLL;
		public var bullets:DLL;
		public var enemies:DLL;
		public var particles:DLL;
		
		public var particleLayer:Sprite;
		public var enemyLayer:Sprite;
		public var playerLayer:Sprite;
		public var bulletLayer:Sprite;
		public var hud:Sprite;
		
		public function Variables() 
		{
			paused = false;
			
			colors = [0xcee3f8, 0xbfdbf6, 0xb0d2f4, 0xa1caf2, 0x93c1f0, 0x84b9ed, 0x75b0eb, 0x66a8e9, 0x579fe7, 0x4897e5];
			players = new DLL();
			bullets = new DLL();
			enemies = new DLL();
			particles = new DLL();
			
			particleLayer = new Sprite();
			enemyLayer = new Sprite();
			playerLayer = new Sprite();
			bulletLayer = new Sprite();
			hud = new Sprite();
			
		}
		
	}

}