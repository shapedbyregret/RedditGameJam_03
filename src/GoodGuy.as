package  
{
	import flash.display.*;

	public class GoodGuy extends Sprite
	{
		public var life:Number;
		public var id:int;
		private var xVel:Number;
		private var yVel:Number;
		private var moveVert:Boolean;
		
		public var shoot:Boolean;
		public var shootArr:Array;
		
		public function GoodGuy() 
		{
			life = 1;
			id = Main.g.players.size();
			xVel = yVel = 3;
			moveVert = true;
			
			shoot = false;
			shootArr = new Array();
			
			draw();
			x = 5;
			y = 5;
			
			Main.g.playerLayer.addChild(this);
			Main.g.players.append(this);
		}
		
		public function update():void
		{
			// Movement
			if (moveVert) {
				if (x < 150) {
					if(y<245) {
						y += Main.g.vel;
					}
					else {
						y = 245;
						moveVert = false;
					}
				}
				else {
					if (y > 5) {
						y -= Main.g.vel;
					}
					else {
						y = 5;
						moveVert = false;
					}
				}
			}
			else {
				if (y > 125) {
					if (x < 295) {
						x += Main.g.vel;
					}
					else {
						x = 295;
						moveVert = true;
					}
				}
				else {
					if (x > 5) {
						x -= Main.g.vel;
					}
					else {
						x = 5;
						moveVert = true;
					}
				}
			}
		
			// Shoot
			if (shootArr.length > 0 && Main.g.timer.currentCount == shootArr[0]) {
				var angRad:Number = Math.atan2(Main._stage.mouseY - y, Main._stage.mouseX - x);
				new Bullet(x, y, -angRad + 1.57079633, 4, id);
				shootArr.shift();
			}
		
		}
		
		public function destroy():void
		{
			Main.g.vel -= Main.g.deltaVel;
			Main.g.playerLayer.removeChild(this);
			Main.g.players.nodeOf(this).remove();
			//for (var i:int = 0; i < 1; i++) { new Particle(x, y, 0xFFFF00); }
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