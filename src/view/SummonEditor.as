package view{
	
	import org.aswing.*;
	import org.aswing.border.*;
	import org.aswing.geom.*;
	import org.aswing.colorchooser.*;
	import org.aswing.ext.*;
	
	/**
	 * SummonEditor
	 */
	public class SummonEditor extends JPanel{
		
		//members define
		private var label71:JLabel;
		private var cRate:JStepper;
		private var label73:JLabel;
		private var cOnceCount:JStepper;
		private var label76:JLabel;
		private var cMaxCount:JStepper;
		
		/**
		 * SummonEditor Constructor
		 */
		public function SummonEditor(){
			//component creation
			setSize(new IntDimension(300, 100));
			var border0:TitledBorder = new TitledBorder();
			border0.setColor(new ASColor(0x0, 1));
			border0.setTitle("召唤相关");
			border0.setPosition(1);
			border0.setBeveled(true);
			setBorder(border0);
			var layout1:GridLayout = new GridLayout();
			layout1.setRows(3);
			layout1.setColumns(2);
			setLayout(layout1);
			
			label71 = new JLabel();
			label71.setLocation(new IntPoint(7, 26));
			label71.setSize(new IntDimension(52, 19));
			label71.setText("召唤概率");
			
			cRate = new JStepper();
			cRate.setLocation(new IntPoint(2, 81));
			cRate.setSize(new IntDimension(296, 60));
			cRate.setColumns(3);
			
			label73 = new JLabel();
			label73.setLocation(new IntPoint(2, 141));
			label73.setSize(new IntDimension(296, 60));
			label73.setText("每次召唤数量");
			
			cOnceCount = new JStepper();
			cOnceCount.setLocation(new IntPoint(150, 81));
			cOnceCount.setSize(new IntDimension(148, 60));
			cOnceCount.setColumns(3);
			
			label76 = new JLabel();
			label76.setLocation(new IntPoint(2, 141));
			label76.setSize(new IntDimension(148, 60));
			label76.setText("最大敌人数量");
			
			cMaxCount = new JStepper();
			cMaxCount.setLocation(new IntPoint(150, 141));
			cMaxCount.setSize(new IntDimension(148, 60));
			cMaxCount.setColumns(3);
			
			//component layoution
			append(label71);
			append(cRate);
			append(label73);
			append(cOnceCount);
			append(label76);
			append(cMaxCount);
			
		}
		
		//_________getters_________
		
		
		public function getCRate():JStepper{
			return cRate;
		}
		
		
		public function getCOnceCount():JStepper{
			return cOnceCount;
		}
		
		
		public function getCMaxCount():JStepper{
			return cMaxCount;
		}
		
		
	}
}
