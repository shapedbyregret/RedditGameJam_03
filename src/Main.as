package 
{
	import flash.display.*;
	import flash.events.*;
	
	import de.polygonal.ds.DLLNode;
	
	public class Main extends Sprite 
	{
		// Embed font
		[Embed(source="fonts/texgyreheros-regular.otf", fontFamily="TexGyreHeros")]
		private var TexGyreHeros:String;
		
		public static var g:Variables;
		public static var _stage:Stage;
		public static var mainLayer:Sprite;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			g = new Variables();
			_stage = stage;
			mainLayer = new Sprite();
			mainLayer.addChild(g.particleLayer);
			mainLayer.addChild(g.enemyLayer);
			mainLayer.addChild(g.playerLayer);
			mainLayer.addChild(g.bulletLayer);
			mainLayer.addChild(g.hud);
			mainLayer.addChild(g.titleScreen);
			addChild(mainLayer);
			
			addEventListener(Event.ENTER_FRAME, update);
			Main._stage.addEventListener(MouseEvent.CLICK, shoot);
			Main._stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			Main._stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			addEventListener(Event.DEACTIVATE, deactivate);
			addEventListener(Event.ACTIVATE, activate);
		}
		
		private function update(e:Event = null):void
		{
			if (!g.paused)
			{
				g.score += 1;
				if (g.score % 180 == 0 && g.players.size()<10) {
					new GoodGuy();
				}
				updateEntities();
				collisions();
				removeEntities();
			}
		}
		
		private function updateEntities():void
		{
			var aNode:DLLNode;
			
			// Update players
			aNode = g.players.head();
			while (aNode != null) {
				aNode.val.update();
				aNode = aNode.next;
			}
			
			// Update bullets
			aNode = g.bullets.head();
			while (aNode != null) {
				aNode.val.update();
				aNode = aNode.next;
			}
			
			// Update enemies
			aNode = g.enemies.head();
			while (aNode != null) {
				aNode.val.update();
				aNode = aNode.next;
			}
			
			// Update particles
			aNode = g.particles.head();
			while (aNode != null) {
				aNode.val.update();
				aNode = aNode.next;
			}
		}
		
		private function collisions():void
		{
			var aNode:DLLNode;
			var bNode:DLLNode;
			var cNode:DLLNode;
			
			aNode = g.bullets.head();
			while (aNode != null) {
				// Bullets to enemies
				bNode = g.enemies.head();
				while (bNode != null) {
					if (aNode.val.hitTestObject(bNode.val)) {
						aNode.val.life -= 1;
						bNode.val.life -= 1;
					}
					bNode = bNode.next;
				}
				// Bullets to players
				cNode = g.players.head();
				while (cNode != null) {
					if (aNode.val.id != cNode.val.id && aNode.val.hitTestObject(cNode.val)) {
						aNode.val.life -= 1;
						cNode.val.life -= 1;
					}
					cNode = cNode.next;
				}
				aNode = aNode.next;
			}
		}
		
		private function removeEntities():void
		{
			var aNode:DLLNode;
			
			// Remove players
			aNode = g.players.head();
			while (aNode != null) {
				if (aNode.val.life <= 0) {
					aNode.val.destroy();
				}
				aNode = aNode.next;
			}
			
			// Update bullets
			aNode = g.bullets.head();
			while (aNode != null) {
				if (aNode.val.life <= 0) {
					aNode.val.destroy();
				}
				aNode = aNode.next;
			}
			
			// Update enemies
			aNode = g.enemies.head();
			while (aNode != null) {
				if (aNode.val.life <= 0) {
					aNode.val.destroy();
				}
				aNode = aNode.next;
			}
			
			// Update particles
			aNode = g.particles.head();
			while (aNode != null) {
				if (aNode.val.life <= 0) {
					aNode.val.destroy();
				}
				aNode = aNode.next;
			}
		}
		
		private function shoot(me:MouseEvent = null):void
		{
			if (!g.paused) {
				var num:int = 0;
				var aNode:DLLNode;
				aNode = g.players.head();
				while (aNode != null)
				{
					aNode.val.shootArr.push(g.timer.currentCount + num);
					num += 1;
					aNode = aNode.next;
				}
			}
		}
		
		private function keyDown(ke:KeyboardEvent):void
		{
			// Split
			if (ke.keyCode == 90) {
				
			}
			// Merge
			if (ke.keyCode == 88) {
				
			}
		}
		
		private function keyUp(ke:KeyboardEvent):void
		{
			// Split
			if (ke.keyCode == 90) {
				
			}
			// Merge
			if (ke.keyCode == 88) {
				
			}
		}
		
		private function deactivate(e:Event):void
		{
			if(!g.titleScreen.visible) {
				g.paused = true;
			}
		}
		
		private function activate(e:Event):void
		{
			if(!g.titleScreen.visible) {
				g.paused = false;
			}
		}
	}
	
}