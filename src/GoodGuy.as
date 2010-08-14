package  
{
	import flash.display.*;

	public class GoodGuy extends Sprite
	{
		
		private var id:int;
		private var xVel:Number;
		private var yVel:Number;
		private var moveVert:Boolean;
		
		public function GoodGuy() 
		{
			id = 0;
			xVel = yVel = 3;
			moveVert = true;
			
			draw();
			x = 5;
			y = 5;
			
			Main.g.playerLayer.addChild(this);
			Main.g.players.append(this);
		}
		
		public function update():void
		{
			if (moveVert) {
				if (x < 150) {
					if(y<245) {
						y += yVel;
					}
					else {
						moveVert = false;
					}
				}
				else {
					if (y > 5) {
						y -= yVel;
					}
					else {
						moveVert = false;
					}
				}
			}
			else {
				if (y > 125) {
					if (x < 295) {
						x += xVel;
					}
					else {
						moveVert = true;
					}
				}
				else {
					if (x > 5) {
						x -= xVel;
					}
					else {
						moveVert = true;
					}
				}
			}
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