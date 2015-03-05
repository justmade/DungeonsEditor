package view
{
	import data.EquipDataManager;
	import data.EquipVO;
	import data.HitCheckType;
	import data.SubResManager;
	
	import fl.motion.AdjustColor;
	import fl.motion.ColorMatrix;
	
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.filesystem.File;
	import flash.filters.ColorMatrixFilter;
	import flash.net.URLRequest;
	import flash.net.dns.AAAARecord;
	
	import org.aswing.JComboBox;
	import org.aswing.JOptionPane;
	import org.aswing.VectorListModel;
	import org.aswing.event.AWEvent;
	
	public class SubBaseLogic extends EventDispatcher
	{
		public var skin:SubBaseEditor;
		
		private static var _instance:SubBaseLogic;
		
		public function SubBaseLogic(lock:Lock)
		{
			init();
		}
		
		public static function getInstance():SubBaseLogic
		{
			if(_instance == null){
				_instance = new SubBaseLogic(new Lock());
			}
			return _instance;
		}
		
		/**
		 * 初始化界面 
		 * 
		 */		
		private function init():void
		{
			skin = new SubBaseEditor();
			
			//初始化此人素材下拉框
			skin.getCbSubRes().setListData(SubResManager.getInstance().fileNames);
			skin.getCbSubRes().setSelectedIndex(-1);
			
			//初始化敌人出现类型
			skin.getCbEnemyType().setListData(["normal", "appear", "summon"]);
			skin.getCbEnemyType().setSelectedIndex(0);
			
			//初始化爆炸范围类型
			skin.getCbExplodeRange().setListData(["Circle", "LCircle", "HEllipse", "VEllipse"]);
			skin.getCbExplodeRange().setSelectedIndex(0);
			
			//初始化敌人ai类型
			skin.getCbAI().setListData(["normal", "pass", "explode", "standshoot"]);
			skin.getCbAI().setSelectedIndex(0);
			
			//初始化敌人基础数值
			skin.getCHP().setValues(2000, 0, 0, 20000);
			skin.getCATK().setValues(5, 0, 1, 20);
			skin.getCDEF().setValues(1, 0, 0, 20);
			skin.getCHitRate().setValues(50, 0, 0, 100);
			skin.getCTATK().setValues(10, 0, 0, 100);
			skin.getCHue().setValues(0, 0, -360, 360);
			
			skin.getCHue().addEventListener(AWEvent.ACT, onCHue);
			skin.getCbSubRes().addEventListener(AWEvent.ACT, onResAct);
			skin.getBtnSave().addEventListener(AWEvent.ACT, onSave);
			
			//初始化装备下拉框
			var a:Array = EquipDataManager.getInstance().weapon;
			skin.getEquip1().setListData(a);
			a = EquipDataManager.getInstance().armor;
			skin.getEquip2().setListData(a);
			a = EquipDataManager.getInstance().ornament;
			skin.getEquip3().setListData(a);
			a = EquipDataManager.getInstance().ornament;
			skin.getEquip4().setListData(a);
		}
		
		private var loader:Loader;
		
		private var cEnemyMC:MovieClip;
		
		/**
		 * 切换敌人素材的回调
		 *  
		 * @param event
		 * 
		 */		
		protected function onResAct(event:AWEvent):void
		{
			var res:String = skin.getCbSubRes().getSelectedItem() as String;
			skin.getCbSubRes().setEditable(false);
			
			var file:File = SubResManager.getInstance().getFileByRes(res);
			
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadComplete);
			loader.load(new URLRequest(file.nativePath));
		}
		/**
		 * 变更色相的回调
		 *  
		 * @param event
		 * 
		 */		
		protected function onCHue(event:AWEvent):void
		{
			if(cEnemyMC){
				var a:AdjustColor = new AdjustColor();
				a.brightness = 0;
				a.contrast = 0;
				a.saturation = 0;
				a.hue = int(skin.getCHue().getValue());
				cEnemyMC.filters = [new ColorMatrixFilter(a.CalculateFinalFlatArray())];
			}
		}
		
		protected function onLoadComplete(event:Event):void
		{
			if(cEnemyMC){
				cEnemyMC.parent.removeChild(cEnemyMC);
			}
			
			var C:Class = loader.contentLoaderInfo.applicationDomain.getDefinition("sub") as Class;
			cEnemyMC = new C() as MovieClip;
			cEnemyMC.gotoAndStop(2);
			cEnemyMC.x = skin.getShowPanel().width / 2;
			cEnemyMC.y = skin.getShowPanel().height / 2;
			skin.getShowPanel().addChild(cEnemyMC);
			
			skin.getCbSubRes().setEditable(true);
		}
		/**
		 * 删除xml数据 
		 * 
		 */		
		public function clearXML():void
		{
			var l:int = cXML.attributes().length();
			for(var i:int = l - 1; i >= 0; i--)
			{
				delete cXML.attributes()[i];
			}
			
			l = cXML.children().length();
			for(i = l - 1; i >= 0; i--){
				delete cXML.children()[i];
			}
		}
		/**
		 * 
		 * @return 敌人数据的xml 
		 * 
		 */		
		public function getXML():XML
		{
			clearXML();
			var xml:XML = cXML;
			
			if(skin.getCbSubRes().getSelectedItem() as String)
			{
				var res:String = skin.getCbSubRes().getSelectedItem();
				xml.@res = res;
				xml.@hitRes = HitCheckType.getHitRes(res);
				var shoots:Array = HitCheckType.getShootXY(res);
				xml.@shootX = shoots[0];
				xml.@shootY = shoots[1];
			}else{
				JOptionPane.showMessageDialog("错误", "潜艇素材没有选择");
				return null;
			}
			
			if(skin.getCbExplodeRange().getSelectedItem() as String){
				xml.@explode = skin.getCbExplodeRange().getSelectedItem() as String;
			}else{
				xml.@explode = "Circle";
			}
			
			if(skin.getTfName().getText() != ""){
				xml.@name = skin.getTfName().getText();
			}else{
				JOptionPane.showMessageDialog("错误", "潜艇没有名字");
				return null;
			}
			
			xml.@ai = skin.getCbAI().getSelectedItem() as String;
			xml.@hp = skin.getCHP().getValue();
			xml.@atk = skin.getCATK().getValue();
			xml.@throughAtk = skin.getCTATK().getValue();
			xml.@def = skin.getCDEF().getValue();
			
			var x:int = int(skin.getTfXPos().getText());
			var y:int = int(skin.getTfYPos().getText());
			if(x != 0 || y != 0){
				xml.@x = x;
				xml.@y = y;
			}
			
			if(skin.getTfSkill().getText() != ""){
				xml.@skill = skin.getTfSkill().getText();
			}
			if(skin.getTfSkill().getText() != ""){
				xml.@skillAnime = skin.getTfSkillAnime().getText();
			}
			
			if(skin.getCHue().getValue() != 0){
				xml.@baseHue = skin.getCHue().getValue();
			}
			
			xml.@enemyType = skin.getCbEnemyType().getSelectedItem() as String;
			if(xml.@enemyType == "appear"){
				if(skin.getTfAppearCondition().getText() == ""){
					JOptionPane.showMessageDialog("错误", "出现条件没有输入");
					return null;
				}else{
					xml.@appearCon = skin.getTfAppearCondition().getText();
				}
			}
			
			xml.@hitRate = skin.getCHitRate().getValue();
			
			if(skin.getCbIsLineShoot().isSelected()){
				xml.@lineShoot = 1;
			}
			
			if(skin.getCbIsSummon().isSelected()){
				xml.@summon = 1;
			}
			
			addEquip(xml, skin.getEquip1());
			addEquip(xml, skin.getEquip2());
			addEquip(xml, skin.getEquip3());
			addEquip(xml, skin.getEquip4());
			
			return xml;
		}
		
		private var cXML:XML;
		/**
		 * 是否装备了第一个饰品 
		 */		
		private var isFirstO:Boolean = false;
		/**
		 *  
		 * @param xml 敌人数据的xml
		 * 
		 */		
		public function setXML(xml:XML):void
		{
			cXML = xml;
			
			if(String(xml.@res) != ""){
				skin.getCbSubRes().setSelectedItem(String(xml.@res));
			}
			if(String(xml.@explode) != ""){
				skin.getCbExplodeRange().setSelectedItem(String(xml.@explode));
			}else{
				skin.getCbExplodeRange().setSelectedIndex(0);
			}
			skin.getTfName().setText(xml.@name);
			
			skin.getCbAI().setSelectedItem(String(xml.@ai));
			skin.getCHP().setValue(xml.@hp);
			skin.getCATK().setValue(xml.@atk);
			skin.getCTATK().setValue(xml.@throughAtk);
			skin.getCDEF().setValue(xml.@def);
			
			skin.getTfXPos().setText(xml.@x);
			skin.getTfYPos().setText(xml.@y);
			
			skin.getTfSkill().setText(xml.@skill);
			skin.getTfSkillAnime().setText(xml.@skillAnime);
			
			if(String(xml.@baseHue) != ""){
				skin.getCHue().setValue(xml.@baseHue);
			}else{
				skin.getCHue().setValue(0);
			}
			
			if(String(xml.@enemyType) != ""){
				skin.getCbEnemyType().setSelectedItem(String(xml.@enemyType));
			}else{
				skin.getCbEnemyType().setSelectedIndex(0);
			}
			
			skin.getTfAppearCondition().setText(xml.@appearCon);
			skin.getCHitRate().setValue(xml.@hitRate);
			
			skin.getCbIsLineShoot().setSelected(xml.@lineShoot == 1);
			skin.getCbIsSummon().setSelected(xml.@summon == 1);
			
			isFirstO = true;
			
			skin.getEquip1().setSelectedIndex(-1);
			skin.getEquip2().setSelectedIndex(-1);
			skin.getEquip3().setSelectedIndex(-1);
			skin.getEquip4().setSelectedIndex(-1);
			
			for(var i:int = 0;i < xml.equip.length(); i++)
			{
				var cx:XML = xml.equip[i];
				setEquip(cx);
			}
		}
		/**
		 * 穿一件装备 
		 * @param xml 装备的xml
		 * 
		 */		
		private function setEquip(xml:XML):void
		{
			
			var code:String = xml.@code;
			var type:String = EquipDataManager.getInstance().getType(code);
			switch(type)
			{
				case "weapon":
					doSetEquip(skin.getEquip1(), code, EquipDataManager.getInstance().weapon);
					break;
				case "armor":
					doSetEquip(skin.getEquip2(), code, EquipDataManager.getInstance().armor);
					break;
				case "ornament":
					if(isFirstO){
						doSetEquip(skin.getEquip3(), code, EquipDataManager.getInstance().ornament);
						isFirstO = false;
					}else{
						doSetEquip(skin.getEquip4(), code, EquipDataManager.getInstance().ornament);
					}
					break;
			}
		}
		
		private function doSetEquip(cb:JComboBox, code:String, array:Array):void
		{
			for(var i:int = 0; i < array.length; i++){
				if(array[i].code == code){
					var index:int = i;
					break;
				}
			}
			cb.setSelectedIndex(index);
		}
		
		private function addEquip(xml:XML, cb:JComboBox):void
		{
			if(cb.getSelectedIndex() >= 0){
				var x:XML = <equip/>;
				x.@code = (cb.getSelectedItem() as EquipVO).code;
				xml.appendChild(x);
			}
		}
		
		/**
		 * 保存敌人数据
		 *  
		 * @param event
		 * 
		 */		
		protected function onSave(event:AWEvent):void
		{
			getXML();
			EnemyListLogic.getInstance().flush();
		}
	}
}class Lock{}