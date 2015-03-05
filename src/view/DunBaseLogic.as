package view
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import org.aswing.JComboBox;
	
	/**
	 * 副本基础数据界面控制类 
	 * 
	 * @author putao
	 * 
	 */	
	public class DunBaseLogic extends EventDispatcher
	{
		public var skin:DunBaseEditor;
		
		public function DunBaseLogic()
		{
			super();
			
			init();
		}
		
		private function init():void
		{
			skin = new DunBaseEditor();
			
			initMaps();
		}
		
		/**
		 * 初始化地图数据 
		 * 
		 */		
		private function initMaps():void
		{
			var a:Array = ["hdyj", "hdcc", "ry", "l_ry", "l_hdyj", "l_hdcc",
			"teachmap", "minimap0", "minimap1", "minimap2", 
			"minimap3", "minimap4", "minimap5", "minimap6", "minimap7",
			"bulutuo", "chestmode", "green_ry", "green_hdcc"];
			skin.getCbMap().setListData(a);
			skin.getCbMap().setSelectedIndex(0);
		}
		
		/**
		 *  
		 * @return 副本基础数据xml
		 * 
		 */		
		public function getXML():XML
		{
			var xml:XML = <dungeon/>;
			if(skin.getCbIsHideBarrier().isSelected()){
				xml.@isHideBarrier = 1;
			}
			if(skin.getCbHasBox().isSelected()){
				xml.@hasBox = 1;
			}else{
				xml.@hasBox = 0;
			}
			if(skin.getCbGod().isSelected()){
				xml.@godMod = 1;
			}
			
			xml.@targetMsg = skin.getTfWinMsg().getText();
			xml.@level = skin.getTfBoxLevel().getText();
			xml.@exp = skin.getTfBaseExp().getText();
			xml.@map = skin.getCbMap().getSelectedItem() as String;
			
			return xml;
		}
		/**
		 * 
		 * @param xml 副本基础数据xml
		 * 
		 */		
		public function setXML(xml:XML):void
		{
			skin.getCbIsHideBarrier().setSelected(xml.@isHideBarrier == 1);
			skin.getCbHasBox().setSelected(xml.@hasBox == 1);
			skin.getCbGod().setSelected(xml.@godMod == 1);
			skin.getTfWinMsg().setText(xml.@targetMsg);
			skin.getTfBoxLevel().setText(xml.@level);
			skin.getTfBaseExp().setText(xml.@exp);
			if(String(xml.@map) != ""){
				skin.getCbMap().setSelectedItem(String(xml.@map));
			}else{
				var mapName:String = xml.map[0].@name;
				skin.getCbMap().setSelectedItem(mapName);
			}
		}
	}
}