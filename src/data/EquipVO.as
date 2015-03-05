package data
{
	/**
	 * 装备数据类 
	 * 
	 * @author putao
	 * 
	 */	
	public class EquipVO
	{
		/**
		 * 装备名称 
		 */		
		public var name:String;
		/**
		 * 装备code 
		 */		
		public var code:String;
		
		public function EquipVO()
		{
			
		}
		
		public static function create(xml:XML):EquipVO
		{
			var vo:EquipVO = new EquipVO();
			vo.name = xml.@name;
			vo.code = xml.@code;
			return vo;
		}
		
		public function toString():String
		{
			return this.name;
		}
	}
}