package view
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import org.aswing.event.AWEvent;
	import org.aswing.event.ListItemEvent;
	
	/**
	 * 敌人列表界面操作类
	 *  
	 * @author putao
	 * 
	 */	
	public class EnemyListLogic extends EventDispatcher
	{
		public var skin:EnemyListEditor;
		
		private static var _instance:EnemyListLogic;
		
		public function EnemyListLogic(lock:Lock)
		{
			init();
		}
		
		public static function getInstance():EnemyListLogic
		{
			if(_instance == null){
				_instance = new EnemyListLogic(new Lock());
			}
			return _instance;
		}
		
		/**
		 * 初始化界面，添加监听 
		 * 
		 */		
		private function init():void
		{
			skin = new EnemyListEditor();
			
			skin.getEnemyList().addEventListener(ListItemEvent.ITEM_CLICK, onItemSelect);
			
			skin.getBtnAddEnemy().addEventListener(AWEvent.ACT, onAddEnemy);
			skin.getBtnDelEnemy().addEventListener(AWEvent.ACT, onDelEnemy);
		}
		
		/**
		 * 删除一个敌人的回调
		 *  
		 * @param event
		 * 
		 */		
		protected function onDelEnemy(event:AWEvent):void
		{
			var index:int = skin.getEnemyList().getSelectedIndex();
			if(index >= 0){
				xmls.splice(index, 1);
				xmlNames.splice(index, 1);
				skin.getEnemyList().setListData(xmlNames);
			}
		}
		
		/**
		 *  刷新敌人数据
		 * 
		 */		
		public function flush():void
		{
			xmlNames = [];
			for(var i:int = 0; i < xmls.length; i++)
			{
				xmlNames.push(String(xmls[i].@name));
			}
			skin.getEnemyList().setListData(xmlNames);
		}
		
		/**
		 * 添加一个敌人的回调
		 *  
		 * @param event
		 * 
		 */		
		protected function onAddEnemy(event:AWEvent):void
		{
			var xml:XML = <enemy name="新敌人" 
			hp="2000" atk="5" def="1" throughAtk="10" 
			ai="normal" hitRate="50"/>;
			xmls.push(xml);
			flush();
			
			skin.getEnemyList().setSelectedIndex(xmls.length - 1);
			SubBaseLogic.getInstance().setXML(xml);
		}
		
		protected function onItemSelect(event:ListItemEvent):void
		{
			var index:int = skin.getEnemyList().getSelectedIndex();
			var xml:XML = xmls[index] as XML;
			
			SubBaseLogic.getInstance().setXML(xml);
		}
		
		private var xmls:Array = [];
		
		private var xmlNames:Array = [];
		
		/**
		 *  
		 * @param xml 敌人列表xml
		 * 
		 */		
		public function setXML(xml:XML):void
		{
			xmls = [];
			xmlNames = [];
			for(var i:int = 0; i < xml.enemy.length(); i++)
			{
				var childXml:XML = xml.enemy[i];
				xmls.push(childXml);
				xmlNames.push(childXml.@name);
			}
			skin.getEnemyList().setListData(xmlNames);
		}
		/**
		 *  
		 * @return 敌人列表xml
		 * 
		 */		
		public function getXML():Array
		{
			return xmls;
		}
	}
}class Lock{}