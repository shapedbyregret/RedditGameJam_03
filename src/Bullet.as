package  
{
	import flash.display.*;
	import de.polygonal.ds.*;
	
	
	public class Bullet extends Sprite
	{
		
		public function Bullet() 
		{
			draw();
			
			Main.g.bulletLayer.addChild(this);
			Main.g.bullets.append(this);
		}
		
		private function draw():void
		{
			graphics.beginFill(0x222222, 1);
			graphics.drawRect( -2.5, -2.5, 5, 5);
			graphics.endFill();
		}
		
	}

}