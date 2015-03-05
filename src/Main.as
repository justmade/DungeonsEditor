package
{
	import data.EquipDataManager;
	import data.HitCheckType;
	import data.SubResManager;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.net.FileFilter;
	import flash.utils.setTimeout;
	
	import org.aswing.AsWingManager;
	import org.aswing.EmptyLayout;
	import org.aswing.Insets;
	import org.aswing.JButton;
	import org.aswing.JOptionPane;
	import org.aswing.JPanel;
	import org.aswing.JTabbedPane;
	import org.aswing.JWindow;
	import org.aswing.border.EmptyBorder;
	
	import view.DunBaseEditor;
	import view.DunBaseLogic;
	import view.EnemyListLogic;
	import view.PlayerSubLogic;
	import view.SubBaseLogic;
	import view.SummonLogic;
	import view.WinConEditor;
	import view.WinConLogic;
	
	[SWF (width="800", height="680")]//, backgroundColor="0xFFFFFF")]
	public class Main extends Sprite
	{
		private var tabpane:JPanel;
		public static var WINDOW:JWindow;
		
		public function Main()
		{
			AsWingManager.setRoot(this);
			WINDOW = new JWindow(this);
			
			tabpane = new JPanel();
			tabpane.setLayout(new EmptyLayout());
			
//			WINDOW.setBorder(new EmptyBorder(null, new Insets(4, 4, 4, 4)));
			WINDOW.setContentPane(tabpane);
			WINDOW.setSizeWH(800, 680);
			WINDOW.show();
			
			init();
		}
		
		private var lDunBase:DunBaseLogic;
		
		private var lSubBase:SubBaseLogic;
		
		private var lPlayerSub:PlayerSubLogic;
		
		private var lSummon:SummonLogic;
		
		private var lEnemyList:EnemyListLogic;
		
		private var lWinCon:WinConLogic;
		
		public function init():void
		{
			SubResManager.getInstance().init();
			HitCheckType.init();
			
			EquipDataManager.getInstance().addEventListener("initComplete", onManagerInitComplete);
			EquipDataManager.getInstance().init();
		}
		
		protected function onManagerInitComplete(event:Event):void
		{
			var btnOpen:JButton = new JButton("打开");
			btnOpen.x = 10;
			btnOpen.y = 10;
			tabpane.append(btnOpen);
			btnOpen.addActionListener(onOpen);
			btnOpen.setSizeWH(60,40);
			
			var btnSave:JButton = new JButton("保存");
			btnSave.x = 100;
			btnSave.y = 10;
			tabpane.append(btnSave);
			btnSave.addActionListener(onSave);
			btnSave.setSizeWH(60,40);
			
			lDunBase = new DunBaseLogic();
			tabpane.append(lDunBase.skin);
			lDunBase.skin.y = 50;
			lDunBase.skin.x = 10;
			
			lSubBase = SubBaseLogic.getInstance();
			tabpane.append(lSubBase.skin);
			lSubBase.skin.x = 315;
			lSubBase.skin.y = 0;
			
			lPlayerSub = new PlayerSubLogic();
			tabpane.append(lPlayerSub.skin);
			lPlayerSub.skin.x = 10;
			lPlayerSub.skin.y = 200;
			
			lSummon = new SummonLogic();
			tabpane.append(lSummon.skin);
			lSummon.skin.x = 10;
			lSummon.skin.y = 305;
			
			lWinCon = new WinConLogic();
			tabpane.append(lWinCon.skin);
			lWinCon.skin.x = 10;
			lWinCon.skin.y = 410;
			
			lEnemyList = EnemyListLogic.getInstance();
			tabpane.append(lEnemyList.skin);
			lEnemyList.skin.x = 10;
			lEnemyList.skin.y = 500;
		}
		
		private var file:File;
		
		private function onOpen(e:Event):void
		{
			file = new File();
			var f:FileFilter = new FileFilter("xml文件", "*.xml");
			file.browse([f]);
			file.addEventListener(Event.SELECT, onFileSelect, false, 0, true);
		}
		
		protected function onFileSelect(event:Event):void
		{
			file.addEventListener(Event.COMPLETE, onLoadComplete);
			file.load();
		}
		
		protected function onLoadComplete(event:Event):void
		{
			var xml:XML = XML(file.data);
			lSummon.setXML(xml.summon[0]);
			lEnemyList.setXML(xml);
			lDunBase.setXML(xml);
			lPlayerSub.setXML(xml.playerShip[0]);
			lWinCon.setXML(xml.storyLine[0]);
		}		
		
		private function onSave(e:Event):void
		{
			var xml:XML = lDunBase.getXML();
			
			var cXML:XML = lPlayerSub.getXML();
			if(cXML){
				xml.appendChild(cXML);
			}else{
				return;
			}
			
			var a:Array = lEnemyList.getXML();
			for(var i:int = 0; i < a.length; i++){
				xml.appendChild(a[i]);
			}
			
			xml.appendChild(lSummon.getXML());
			xml.appendChild(lWinCon.getXML());
			
			file = new File();
			var ff:FileFilter = new FileFilter("xml", "*.xml");
			file.save(xml, "dungeon.xml");
		}
	}
}