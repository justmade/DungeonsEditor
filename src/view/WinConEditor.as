package view{
	
	import org.aswing.*;
	import org.aswing.border.*;
	import org.aswing.geom.*;
	import org.aswing.colorchooser.*;
	import org.aswing.ext.*;
	
	/**
	 * WinConEditor
	 */
	public class WinConEditor extends JPanel{
		
		//members define
		private var panel61:JPanel;
		private var rAll:JRadioButton;
		private var rKill:JRadioButton;
		private var rMove:JRadioButton;
		private var panel66:JPanel;
		private var label67:JLabel;
		private var tfParams:JTextField;
		
		/**
		 * WinConEditor Constructor
		 */
		public function WinConEditor(){
			//component creation
			setSize(new IntDimension(300, 88));
			var border0:TitledBorder = new TitledBorder();
			border0.setColor(new ASColor(0x0, 1));
			border0.setTitle("胜利条件");
			border0.setPosition(1);
			border0.setBeveled(true);
			setBorder(border0);
			var layout1:SoftBoxLayout = new SoftBoxLayout();
			layout1.setAxis(AsWingConstants.VERTICAL);
			setLayout(layout1);
			
			panel61 = new JPanel();
			panel61.setLocation(new IntPoint(5, 5));
			panel61.setSize(new IntDimension(10, 10));
			
			rAll = new JRadioButton();
			rAll.setLocation(new IntPoint(5, 5));
			rAll.setSize(new IntDimension(56, 19));
			rAll.setToolTipText("参数不用填");
			rAll.setText("敌全灭");
			rAll.setSelected(true);
			
			rKill = new JRadioButton();
			rKill.setLocation(new IntPoint(66, 5));
			rKill.setSize(new IntDimension(92, 19));
			rKill.setToolTipText("参数格式“1”，表示消灭第一个非召唤类敌人");
			rKill.setText("消灭特定敌人");
			
			rMove = new JRadioButton();
			rMove.setLocation(new IntPoint(163, 5));
			rMove.setSize(new IntDimension(92, 19));
			rMove.setToolTipText("参数格式“200@200”，表示移动到坐标（200，200）");
			rMove.setText("移动到指定点");
			
			panel66 = new JPanel();
			panel66.setLocation(new IntPoint(2, 50));
			panel66.setSize(new IntDimension(396, 32));
			var layout2:EmptyLayout = new EmptyLayout();
			panel66.setLayout(layout2);
			
			label67 = new JLabel();
			label67.setLocation(new IntPoint(5, 6));
			label67.setSize(new IntDimension(31, 19));
			label67.setText("参数");
			
			tfParams = new JTextField();
			tfParams.setLocation(new IntPoint(38, 5));
			tfParams.setSize(new IntDimension(231, 22));
			
			//component layoution
			append(panel61);
			append(panel66);
			
			panel61.append(rAll);
			panel61.append(rKill);
			panel61.append(rMove);
			
			panel66.append(label67);
			panel66.append(tfParams);
			
		}
		
		//_________getters_________
		
		
		public function getRAll():JRadioButton{
			return rAll;
		}
		
		public function getRKill():JRadioButton{
			return rKill;
		}
		
		public function getRMove():JRadioButton{
			return rMove;
		}
		
		
		
		public function getTfParams():JTextField{
			return tfParams;
		}
		
		
	}
}
