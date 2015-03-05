package view{
	
	import org.aswing.*;
	import org.aswing.border.*;
	import org.aswing.geom.*;
	import org.aswing.colorchooser.*;
	import org.aswing.ext.*;
	
	/**
	 * EnemyListEditor
	 */
	public class EnemyListEditor extends JPanel{
		
		//members define
		private var scrollpane5:JScrollPane;
		private var enemyList:JList;
		private var btnAddEnemy:JButton;
		private var btnDelEnemy:JButton;
		
		/**
		 * EnemyListEditor Constructor
		 */
		public function EnemyListEditor(){
			//component creation
			setSize(new IntDimension(300, 181));
			var border0:TitledBorder = new TitledBorder();
			border0.setColor(new ASColor(0x0, 1));
			border0.setTitle("敌人列表");
			border0.setPosition(1);
			border0.setBeveled(true);
			setBorder(border0);
			var layout1:EmptyLayout = new EmptyLayout();
			setLayout(layout1);
			
			scrollpane5 = new JScrollPane();
			scrollpane5.setLocation(new IntPoint(2, 20));
			scrollpane5.setSize(new IntDimension(294, 118));
			var border2:LineBorder = new LineBorder();
			border2.setColor(new ASColor(0xcccccc, 1));
			border2.setThickness(2);
			scrollpane5.setBorder(border2);
			
			enemyList = new JList();
			enemyList.setLocation(new IntPoint(0, 20));
			enemyList.setSize(new IntDimension(290, 166));
			
			btnAddEnemy = new JButton();
			btnAddEnemy.setLocation(new IntPoint(64, 146));
			btnAddEnemy.setSize(new IntDimension(58, 26));
			btnAddEnemy.setText("添加敌人");
			
			btnDelEnemy = new JButton();
			btnDelEnemy.setLocation(new IntPoint(167, 147));
			btnDelEnemy.setSize(new IntDimension(58, 26));
			btnDelEnemy.setText("删除敌人");
			
			//component layoution
			append(scrollpane5);
			append(btnAddEnemy);
			append(btnDelEnemy);
			
			scrollpane5.append(enemyList);
			
		}
		
		//_________getters_________
		
		
		public function getEnemyList():JList{
			return enemyList;
		}
		
		public function getBtnAddEnemy():JButton{
			return btnAddEnemy;
		}
		
		public function getBtnDelEnemy():JButton{
			return btnDelEnemy;
		}
		
		
	}
}
