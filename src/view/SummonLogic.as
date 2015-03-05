package view
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	/**
	 * 召唤相关界面控制类 
	 * 
	 * @author putao
	 * 
	 */	
	public class SummonLogic extends EventDispatcher
	{
		public var skin:SummonEditor;
		
		public function SummonLogic()
		{
			super();
			
			init();
		}
		
		private function init():void
		{
			skin = new SummonEditor();
			
			skin.getCMaxCount().setValues(3, 0, 0, 10);
			skin.getCOnceCount().setValues(1, 0, 0, 3);
			skin.getCRate().setValues(50, 0, 0, 100);
		}
		
		/**
		 *  
		 * @return 召唤相关数据的xml
		 * 
		 */		
		public function getXML():XML
		{
			var xml:XML = <summon/>;
			xml.@rate = skin.getCRate().getValue();
			xml.@onceCount = skin.getCOnceCount().getValue();
			xml.@max = skin.getCMaxCount().getValue();
			return xml;
		}
		/**
		 * 
		 * @param xml 召唤相关数据的xml
		 * 
		 */		
		public function setXML(xml:XML):void
		{
			if(xml){
				skin.getCMaxCount().setValue(xml.@max);
				skin.getCRate().setValue(xml.@rate);
				skin.getCOnceCount().setValue(xml.@onceCount);
			}else{
				skin.getCMaxCount().setValue(0);
				skin.getCRate().setValue(0);
				skin.getCOnceCount().setValue(0);
			}
		}
	}
}