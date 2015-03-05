package view{
	
	import org.aswing.*;
	import org.aswing.border.*;
	import org.aswing.geom.*;
	import org.aswing.colorchooser.*;
	import org.aswing.ext.*;
	
	/**
	 * DunBaseEditor
	 */
	public class DunBaseEditor extends JPanel{
		
		//members define
		private var cbIsHideBarrier:JCheckBox;
		private var cbGod:JCheckBox;
		private var cbHasBox:JCheckBox;
		private var label24:JLabel;
		private var label14:JLabel;
		private var tfWinMsg:JTextField;
		private var label16:JLabel;
		private var tfBaseExp:JTextField;
		private var label18:JLabel;
		private var tfBoxLevel:JTextField;
		private var label22:JLabel;
		private var cbMap:JComboBox;
		
		/**
		 * DunBaseEditor Constructor
		 */
		public function DunBaseEditor(){
			//component creation
			setSize(new IntDimension(300, 150));
			var border0:TitledBorder = new TitledBorder();
			border0.setColor(new ASColor(0x0, 1));
			border0.setTitle("副本基础数据");
			border0.setPosition(1);
			border0.setBeveled(true);
			setBorder(border0);
			var layout1:GridLayout = new GridLayout();
			layout1.setRows(6);
			layout1.setColumns(3);
			setLayout(layout1);
			
			cbIsHideBarrier = new JCheckBox();
			cbIsHideBarrier.setLocation(new IntPoint(7, 23));
			cbIsHideBarrier.setSize(new IntDimension(88, 19));
			cbIsHideBarrier.setText("隐藏障碍物");
			
			cbGod = new JCheckBox();
			cbGod.setLocation(new IntPoint(100, 21));
			cbGod.setSize(new IntDimension(98, 25));
			cbGod.setText("玩家不死");
			
			cbHasBox = new JCheckBox();
			cbHasBox.setLocation(new IntPoint(2, 97));
			cbHasBox.setSize(new IntDimension(261, 76));
			cbHasBox.setText("是否显示宝箱");
			
			label24 = new JLabel();
			label24.setLocation(new IntPoint(150, 42));
			label24.setSize(new IntDimension(148, 21));
			
			label14 = new JLabel();
			label14.setLocation(new IntPoint(2, 97));
			label14.setSize(new IntDimension(130, 76));
			label14.setText("胜利条件文本：");
			
			tfWinMsg = new JTextField();
			tfWinMsg.setLocation(new IntPoint(132, 97));
			tfWinMsg.setSize(new IntDimension(130, 76));
			
			label16 = new JLabel();
			label16.setLocation(new IntPoint(89, 97));
			label16.setSize(new IntDimension(87, 76));
			label16.setText("基础经验值：");
			
			tfBaseExp = new JTextField();
			tfBaseExp.setLocation(new IntPoint(176, 97));
			tfBaseExp.setSize(new IntDimension(87, 76));
			
			label18 = new JLabel();
			label18.setLocation(new IntPoint(2, 69));
			label18.setSize(new IntDimension(87, 24));
			label18.setText("战后抽奖宝箱等级：");
			
			tfBoxLevel = new JTextField();
			tfBoxLevel.setLocation(new IntPoint(134, 120));
			tfBoxLevel.setSize(new IntDimension(132, 33));
			
			label22 = new JLabel();
			label22.setLocation(new IntPoint(178, 87));
			label22.setSize(new IntDimension(88, 33));
			label22.setText("地图");
			
			cbMap = new JComboBox();
			cbMap.setLocation(new IntPoint(2, 120));
			cbMap.setSize(new IntDimension(88, 33));
			cbMap.setMaximumRowCount(7);
			
			//component layoution
			append(cbIsHideBarrier);
			append(cbGod);
			append(cbHasBox);
			append(label24);
			append(label14);
			append(tfWinMsg);
			append(label16);
			append(tfBaseExp);
			append(label18);
			append(tfBoxLevel);
			append(label22);
			append(cbMap);
			
		}
		
		//_________getters_________
		
		public function getCbIsHideBarrier():JCheckBox{
			return cbIsHideBarrier;
		}
		
		public function getCbGod():JCheckBox{
			return cbGod;
		}
		
		public function getCbHasBox():JCheckBox{
			return cbHasBox;
		}
		
		
		
		public function getTfWinMsg():JTextField{
			return tfWinMsg;
		}
		
		
		public function getTfBaseExp():JTextField{
			return tfBaseExp;
		}
		
		
		public function getTfBoxLevel():JTextField{
			return tfBoxLevel;
		}
		
		
		public function getCbMap():JComboBox{
			return cbMap;
		}
		
		
	}
}
