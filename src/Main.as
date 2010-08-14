package 
{
	import de.polygonal.ds.DLLNode;
	import flash.display.*;
	import flash.events.*;
	
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
			addChild(mainLayer);
		}
		
		private function update():void
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
		
	}
	
}