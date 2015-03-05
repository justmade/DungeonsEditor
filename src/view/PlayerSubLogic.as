package view
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	/**
	 * 玩家潜艇界面控制类
	 *  
	 * @author putao
	 * 
	 */	
	public class PlayerSubLogic extends EventDispatcher
	{
		public var skin:PlayerSubEditor;
		
		public function PlayerSubLogic()
		{
			super();
			
			init();
		}
		
		private function init():void
		{
			skin = new PlayerSubEditor();
		}
		
		/**
		 *  
		 * @return 玩家潜艇数据xml
		 * 
		 */		
		public function getXML():XML
		{
			var xml:XML = <playerShip/>;
			
			if(skin.getTfX().getText() != ""){
				xml.@x = skin.getTfX().getText();
			}
			if(skin.getTfY().getText() != ""){
				xml.@y = skin.getTfY().getText();
			}
			if(skin.getTfPlayerSub().getText() != "")
			{
				xml.@code = skin.getTfPlayerSub().getText();
			}
			return xml;
		}
		/**
		 * 
		 * @param xml 玩家潜艇数据xml
		 * 
		 */		
		public function setXML(xml:XML):void
		{
			if(xml){
				skin.getTfX().setText(xml.@x);
				skin.getTfY().setText(xml.@y);
				skin.getTfPlayerSub().setText(xml.@code);
			}
		}
	}
}