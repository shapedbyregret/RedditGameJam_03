package  
{
	import flash.display.*;

	public class GoodGuy extends Sprite
	{
		
		private var id:int;
		private var xVel:Number;
		private var yVel:Number;
		
		public function GoodGuy() 
		{
			id = 0;
			xVel = 5;
			yVel = 5;
			
			draw();
			x = 5;
			y = 5;
			
			Main.g.playerLayer.addChild(this);
			Main.g.players.append(this);
		}
		
		public function update():void
		{
			
		}
		
		private function draw():void
		{
			graphics.lineStyle(1, 0x222222, 1);
			graphics.beginFill(Main.g.colors[id], 0.8);
			graphics.drawRect( -5, -5, 10, 10);
			graphics.endFill();
		}
		
	}

}