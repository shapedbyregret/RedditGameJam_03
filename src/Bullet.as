package  
{
	import flash.display.*;
	import de.polygonal.ds.*;
	
	
	public class Bullet extends Sprite
	{
		
		public var life:Number;
		public var id:int;
		private var xVel:Number;
		private var yVel:Number;
		
		public function Bullet(newX:Number, newY:Number, newAng:Number, newAcc:Number, newId:int) 
		{
			life = 1;
			id = newId;
			xVel = newAcc * Math.sin(newAng);
			yVel = newAcc * Math.cos(newAng);
			
			draw();
			x = newX;
			y = newY;
			
			Main.g.bulletLayer.addChild(this);
			Main.g.bullets.append(this);
		}
		
		public function update():void
		{
			x += xVel;
			y += yVel;
			
			if (x < 0 || x > 300 || y < 0 || y > 250) {
				life = 0;
			}
		}
		
		public function destroy():void
		{
			//removeEventListener(Event.ENTER_FRAME, update);
			Main.g.bulletLayer.removeChild(this);
			Main.g.bullets.nodeOf(this).remove();
			//for (var i:int = 0; i < 1; i++) { new Particle(x, y, 0xFFFF00); }
		}
		
		private function draw():void
		{
			graphics.beginFill(Main.g.colors[id], 1);
			graphics.drawRect( -2.5, -2.5, 5, 5);
			graphics.endFill();
		}
		
	}

}