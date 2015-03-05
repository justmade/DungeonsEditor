package view{
	
	import org.aswing.*;
	import org.aswing.border.*;
	import org.aswing.geom.*;
	import org.aswing.colorchooser.*;
	import org.aswing.ext.*;
	
	/**
	 * PlayerSubEditor
	 */
	public class PlayerSubEditor extends JPanel{
		
		//members define
		private var label64:JLabel;
		private var tfX:JTextField;
		private var label66:JLabel;
		private var tfY:JTextField;
		private var label68:JLabel;
		private var tfPlayerSub:JTextField;
		
		/**
		 * PlayerSubEditor Constructor
		 */
		public function PlayerSubEditor(){
			//component creation
			setSize(new IntDimension(300, 100));
			var border0:TitledBorder = new TitledBorder();
			border0.setColor(new ASColor(0x0, 1));
			border0.setTitle("玩家潜艇");
			border0.setPosition(1);
			border0.setBeveled(true);
			setBorder(border0);
			var layout1:GridLayout = new GridLayout();
			layout1.setRows(3);
			layout1.setColumns(2);
			setLayout(layout1);
			
			label64 = new JLabel();
			label64.setLocation(new IntPoint(7, 26));
			label64.setSize(new IntDimension(35, 19));
			label64.setText("X坐标");
			
			tfX = new JTextField();
			tfX.setLocation(new IntPoint(47, 26));
			tfX.setSize(new IntDimension(12, 22));
			
			label66 = new JLabel();
			label66.setLocation(new IntPoint(2, 81));
			label66.setSize(new IntDimension(133, 60));
			label66.setText("Y坐标");
			
			tfY = new JTextField();
			tfY.setLocation(new IntPoint(135, 81));
			tfY.setSize(new IntDimension(133, 60));
			
			label68 = new JLabel();
			label68.setLocation(new IntPoint(91, 81));
			label68.setSize(new IntDimension(89, 60));
			label68.setText("限制玩家潜艇");
			
			tfPlayerSub = new JTextField();
			tfPlayerSub.setLocation(new IntPoint(180, 81));
			tfPlayerSub.setSize(new IntDimension(89, 60));
			tfPlayerSub.setToolTipText("进图地图后，必定选择此潜艇");
			
			//component layoution
			append(label64);
			append(tfX);
			append(label66);
			append(tfY);
			append(label68);
			append(tfPlayerSub);
			
		}
		
		//_________getters_________
		
		
		public function getTfX():JTextField{
			return tfX;
		}
		
		
		public function getTfY():JTextField{
			return tfY;
		}
		
		
		public function getTfPlayerSub():JTextField{
			return tfPlayerSub;
		}
		
		
	}
}
