package  
{
	import flash.display.*;
	import flash.text.*;
	
	import de.polygonal.ds.*;
	
	public class Enemy extends Sprite
	{
		
		public var life:Number;
		private var xVel:Number;
		private var yVel:Number;
		
		public function Enemy(newX:Number, newY:Number, newAcc:Number) 
		{
			life = 1;
			xVel = yVel = newAcc;
			
			draw();
			x = newX;
			y = newY;
			
			Main.g.enemyLayer.addChild(this);
			Main.g.enemies.append(this);
		}
		
		public function update():void
		{
			x += xVel;
			y += yVel;
			
			if (x < 0 || x > 300-width) {
				xVel *= -1;
			}
			if (y < 0 || y > 250-height) {
				yVel *= -1;
			}
		}
		
		public function destroy():void
		{
			Main.g.score += 10;
			Main.g.enemyLayer.removeChild(this);
			Main.g.enemies.nodeOf(this).remove();
			//for (var i:int = 0; i < 1; i++) { new Particle(x, y, 0xFFFF00); }
		}
		
		private function draw():void
		{
			//graphics.beginFill(0x222222, 1);
			//graphics.drawRect( -2.5, -2.5, 5, 5);
			//graphics.endFill();
			var bmp:Bitmap = new Main.LOD();
			addChild(bmp);
		}
		
		private function tfHelper(newX:Number, newY:Number):TextField
		{
			var tf:TextField = new TextField();
			tf.selectable = false;
			tf.styleSheet = Main.g.styles;
			tf.embedFonts = true;
			tf.autoSize = TextFieldAutoSize.CENTER;
			tf.x = newX;
			tf.y = newY;
			
			return tf;
		}
		
	}

}