package data
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	/**
	 * 装备数据管理类 
	 * 
	 * @author putao
	 * 
	 */	
	public class EquipDataManager extends EventDispatcher
	{
		private static var _instance:EquipDataManager;
		
		public function EquipDataManager(lock:Lock)
		{
			
		}
		
		public static function getInstance():EquipDataManager
		{
			if(_instance == null){
				_instance = new EquipDataManager(new Lock());
			}
			return _instance;
		}
		
		public function init():void
		{
			var l:URLLoader = new URLLoader();
			l.addEventListener(Event.COMPLETE, onLoadComplete);
			l.load(new URLRequest("assets/equip.xml"));
		}
		
		public var weapon:Array = [];
		
		public var armor:Array = [];
		
		public var ornament:Array = [];
		
		protected function onLoadComplete(event:Event):void
		{
			var l:URLLoader = event.currentTarget as URLLoader;
			var xml:XML = XML(l.data);
			
			for(var i:int = 0; i < xml.children().length(); i++)
			{
				var cxml:XML = xml.children()[i];
				var vo:EquipVO = EquipVO.create(cxml);
				if(cxml.name() == "weapon"){
					weapon.push(vo);
				}else if(cxml.name() == "armor"){
					armor.push(vo);
				}else if(cxml.name() == "ornament"){
					ornament.push(vo);
				}
			}
			dispatchEvent(new Event("initComplete"));
		}
		
		public function getType(code:String):String
		{
			if(indexInArrayByProperty(weapon, code, "code") >= 0){
				return "weapon";
			}
			if(indexInArrayByProperty(armor, code, "code") >= 0){
				return "armor";
			}
			if(indexInArrayByProperty(ornament, code, "code") >= 0){
				return "ornament";
			}
			return "";
		}
		
		public static function indexInArrayByProperty(arr:Array,value:*,property:String = "name"):int{
			for(var i:int;i<arr.length;i++){
				if(arr[i][property] == value){
					return i;
				}
			}
			return -1;
		}

	}
}class Lock{}