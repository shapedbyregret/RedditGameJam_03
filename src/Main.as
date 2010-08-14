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
			mainLayer = new Sprite();
			mainLayer.addChild(g.particleLayer);
			mainLayer.addChild(g.enemyLayer);
			mainLayer.addChild(g.playerLayer);
			mainLayer.addChild(g.bulletLayer);
			mainLayer.addChild(g.hud);
			mainLayer.addChild(g.titleScreen);
			addChild(mainLayer);
			
			addEventListener(Event.ENTER_FRAME, update);
			addEventListener(MouseEvent.CLICK, shoot);
			addEventListener(Event.DEACTIVATE, deactivate);
			addEventListener(Event.ACTIVATE, activate);
		}
		
		private function update(e:Event = null):void
		{
			if (!g.paused)
			{
				updateEntities();
			}
		}
		
		private function updateEntities():void
		{
			var aNode:DLLNode;
			aNode = g.players.head();
			while (aNode != null)
			{
				aNode.val.update();
				aNode = aNode.next;
			}
		}
		
		private function shoot(me:MouseEvent):void
		{
			
		}
		
		private function deactivate(e:Event):void
		{
			if(!Main.g.titleScreen.visible) {
				Main.g.paused = true;
			}
		}
		
		private function activate(e:Event):void
		{
			if(!Main.g.titleScreen.visible) {
				Main.g.paused = false;
			}
		}
	}
	
}