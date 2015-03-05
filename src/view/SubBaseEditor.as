package view{
	
	import org.aswing.*;
	import org.aswing.border.*;
	import org.aswing.geom.*;
	import org.aswing.colorchooser.*;
	import org.aswing.ext.*;
	
	/**
	 * SubBaseEditor
	 */
	public class SubBaseEditor extends JPanel{
		
		//members define
		private var showPanel:JPanel;
		private var panel42:JPanel;
		private var panel51:JPanel;
		private var label43:JLabel;
		private var label45:JLabel;
		private var label47:JLabel;
		private var label49:JLabel;
		private var panel52:JPanel;
		private var equip1:JComboBox;
		private var equip2:JComboBox;
		private var equip3:JComboBox;
		private var equip4:JComboBox;
		private var panel26:JPanel;
		private var label27:JLabel;
		private var cbSubRes:JComboBox;
		private var label29:JLabel;
		private var tfName:JTextField;
		private var label55:JLabel;
		private var cbExplodeRange:JComboBox;
		private var label31:JLabel;
		private var cbAI:JComboBox;
		private var label33:JLabel;
		private var cHP:JStepper;
		private var label35:JLabel;
		private var cATK:JStepper;
		private var label37:JLabel;
		private var cDEF:JStepper;
		private var label39:JLabel;
		private var cTATK:JStepper;
		private var label42:JLabel;
		private var tfXPos:JTextField;
		private var label44:JLabel;
		private var tfYPos:JTextField;
		private var label51:JLabel;
		private var tfSkill:JTextField;
		private var label48:JLabel;
		private var tfSkillAnime:JTextField;
		private var label53:JLabel;
		private var cHue:JStepper;
		private var label57:JLabel;
		private var cbEnemyType:JComboBox;
		private var label59:JLabel;
		private var tfAppearCondition:JTextField;
		private var label83:JLabel;
		private var cHitRate:JStepper;
		private var cbIsSummon:JCheckBox;
		private var cbIsLineShoot:JCheckBox;
		private var btnSave:JButton;
		
		/**
		 * SubBaseEditor Constructor
		 */
		public function SubBaseEditor(){
			//component creation
			setSize(new IntDimension(360, 630));
			var border0:TitledBorder = new TitledBorder();
			border0.setColor(new ASColor(0x0, 1));
			border0.setTitle("潜艇数据");
			border0.setPosition(1);
			border0.setBeveled(true);
			setBorder(border0);
			var layout1:EmptyLayout = new EmptyLayout();
			setLayout(layout1);
			
			showPanel = new JPanel();
			showPanel.setLocation(new IntPoint(0, 20));
			showPanel.setSize(new IntDimension(185, 179));
			var layout2:GridLayout = new GridLayout();
			layout2.setRows(1);
			layout2.setColumns(0);
			showPanel.setLayout(layout2);
			
			panel42 = new JPanel();
			panel42.setLocation(new IntPoint(150, 96));
			panel42.setSize(new IntDimension(205, 107));
			var layout3:EmptyLayout = new EmptyLayout();
			panel42.setLayout(layout3);
			
			panel51 = new JPanel();
			panel51.setLocation(new IntPoint(0, 0));
			panel51.setSize(new IntDimension(66, 107));
			var layout4:GridLayout = new GridLayout();
			layout4.setRows(4);
			layout4.setColumns(0);
			panel51.setLayout(layout4);
			
			label43 = new JLabel();
			label43.setLocation(new IntPoint(0, 0));
			label43.setSize(new IntDimension(87, 26));
			label43.setText("武器");
			
			label45 = new JLabel();
			label45.setLocation(new IntPoint(68, 0));
			label45.setSize(new IntDimension(61, 83));
			label45.setText("防具");
			
			label47 = new JLabel();
			label47.setLocation(new IntPoint(102, 0));
			label47.setSize(new IntDimension(41, 83));
			label47.setText("饰品");
			
			label49 = new JLabel();
			label49.setLocation(new IntPoint(102, 0));
			label49.setSize(new IntDimension(30, 83));
			label49.setText("饰品");
			
			panel52 = new JPanel();
			panel52.setLocation(new IntPoint(52, 0));
			panel52.setSize(new IntDimension(152, 107));
			var layout5:GridLayout = new GridLayout();
			layout5.setRows(4);
			layout5.setColumns(1);
			panel52.setLayout(layout5);
			
			equip1 = new JComboBox();
			equip1.setLocation(new IntPoint(0, 83));
			equip1.setSize(new IntDimension(123, 83));
			equip1.setEditable(true);
			equip1.setMaximumRowCount(7);
			
			equip2 = new JComboBox();
			equip2.setLocation(new IntPoint(61, 83));
			equip2.setSize(new IntDimension(61, 83));
			equip2.setEditable(true);
			equip2.setMaximumRowCount(7);
			
			equip3 = new JComboBox();
			equip3.setLocation(new IntPoint(82, 83));
			equip3.setSize(new IntDimension(41, 83));
			equip3.setEditable(true);
			equip3.setMaximumRowCount(7);
			
			equip4 = new JComboBox();
			equip4.setLocation(new IntPoint(90, 83));
			equip4.setSize(new IntDimension(30, 83));
			equip4.setEditable(true);
			equip4.setMaximumRowCount(7);
			
			panel26 = new JPanel();
			panel26.setLocation(new IntPoint(2, 210));
			panel26.setSize(new IntDimension(351, 418));
			var layout6:GridLayout = new GridLayout();
			layout6.setRows(18);
			layout6.setColumns(2);
			panel26.setLayout(layout6);
			
			label27 = new JLabel();
			label27.setSize(new IntDimension(396, 125));
			label27.setText("潜艇素材");
			
			cbSubRes = new JComboBox();
			cbSubRes.setLocation(new IntPoint(0, 125));
			cbSubRes.setSize(new IntDimension(396, 125));
			cbSubRes.setEditable(false);
			cbSubRes.setMaximumRowCount(7);
			
			label29 = new JLabel();
			label29.setLocation(new IntPoint(0, 125));
			label29.setSize(new IntDimension(198, 125));
			label29.setText("名字");
			
			tfName = new JTextField();
			tfName.setLocation(new IntPoint(198, 125));
			tfName.setSize(new IntDimension(198, 125));
			
			label55 = new JLabel();
			label55.setLocation(new IntPoint(0, 44));
			label55.setSize(new IntDimension(198, 271));
			label55.setText("爆炸范围");
			
			cbExplodeRange = new JComboBox();
			cbExplodeRange.setLocation(new IntPoint(198, 44));
			cbExplodeRange.setSize(new IntDimension(198, 22));
			cbExplodeRange.setEditable(false);
			cbExplodeRange.setMaximumRowCount(7);
			
			label31 = new JLabel();
			label31.setLocation(new IntPoint(132, 125));
			label31.setSize(new IntDimension(132, 125));
			label31.setText("AI");
			
			cbAI = new JComboBox();
			cbAI.setLocation(new IntPoint(264, 125));
			cbAI.setSize(new IntDimension(132, 125));
			cbAI.setEditable(true);
			cbAI.setMaximumRowCount(7);
			
			label33 = new JLabel();
			label33.setLocation(new IntPoint(198, 125));
			label33.setSize(new IntDimension(99, 125));
			label33.setText("HP");
			
			cHP = new JStepper();
			cHP.setLocation(new IntPoint(297, 125));
			cHP.setSize(new IntDimension(99, 125));
			cHP.setColumns(3);
			
			label35 = new JLabel();
			label35.setLocation(new IntPoint(237, 125));
			label35.setSize(new IntDimension(79, 125));
			label35.setText("ATK");
			
			cATK = new JStepper();
			cATK.setLocation(new IntPoint(316, 125));
			cATK.setSize(new IntDimension(79, 125));
			cATK.setColumns(3);
			
			label37 = new JLabel();
			label37.setLocation(new IntPoint(0, 125));
			label37.setSize(new IntDimension(198, 25));
			label37.setText("DEF");
			
			cDEF = new JStepper();
			cDEF.setLocation(new IntPoint(198, 125));
			cDEF.setSize(new IntDimension(198, 25));
			cDEF.setColumns(3);
			
			label39 = new JLabel();
			label39.setLocation(new IntPoint(0, 150));
			label39.setSize(new IntDimension(198, 25));
			label39.setText("贯穿攻击力");
			
			cTATK = new JStepper();
			cTATK.setLocation(new IntPoint(198, 150));
			cTATK.setSize(new IntDimension(198, 25));
			cTATK.setColumns(3);
			
			label42 = new JLabel();
			label42.setLocation(new IntPoint(0, 175));
			label42.setSize(new IntDimension(198, 25));
			label42.setText("X坐标");
			
			tfXPos = new JTextField();
			tfXPos.setLocation(new IntPoint(198, 175));
			tfXPos.setSize(new IntDimension(198, 25));
			tfXPos.setToolTipText("潜艇的初试位置，如果不设置，则放在地图默认位置中");
			
			label44 = new JLabel();
			label44.setLocation(new IntPoint(0, 200));
			label44.setSize(new IntDimension(198, 25));
			label44.setText("Y坐标");
			
			tfYPos = new JTextField();
			tfYPos.setLocation(new IntPoint(198, 200));
			tfYPos.setSize(new IntDimension(198, 25));
			
			label51 = new JLabel();
			label51.setLocation(new IntPoint(0, 209));
			label51.setSize(new IntDimension(198, 19));
			label51.setText("SKILL");
			
			tfSkill = new JTextField();
			tfSkill.setLocation(new IntPoint(198, 209));
			tfSkill.setSize(new IntDimension(198, 19));
			tfSkill.setToolTipText("潜艇的技能，请查看Item表");
			
			label48 = new JLabel();
			label48.setLocation(new IntPoint(0, 264));
			label48.setSize(new IntDimension(146, 24));
			label48.setText("技能动画");
			
			tfSkillAnime = new JTextField();
			tfSkillAnime.setLocation(new IntPoint(194, 168));
			tfSkillAnime.setSize(new IntDimension(97, 24));
			tfSkillAnime.setToolTipText("现在支持的值为：blSkill,tsSkill,dsSkill,shzSkill,ffSkill,ldSkill,sySkill");
			
			label53 = new JLabel();
			label53.setLocation(new IntPoint(0, 228));
			label53.setSize(new IntDimension(198, 19));
			label53.setText("色相");
			
			cHue = new JStepper();
			cHue.setLocation(new IntPoint(146, 264));
			cHue.setSize(new IntDimension(146, 24));
			cHue.setColumns(3);
			
			label57 = new JLabel();
			label57.setLocation(new IntPoint(0, 240));
			label57.setSize(new IntDimension(198, 20));
			label57.setText("敌人类型");
			
			cbEnemyType = new JComboBox();
			cbEnemyType.setLocation(new IntPoint(198, 240));
			cbEnemyType.setSize(new IntDimension(198, 20));
			cbEnemyType.setEditable(false);
			cbEnemyType.setMaximumRowCount(7);
			
			label59 = new JLabel();
			label59.setLocation(new IntPoint(0, 260));
			label59.setSize(new IntDimension(198, 20));
			label59.setText("出现条件");
			
			tfAppearCondition = new JTextField();
			tfAppearCondition.setLocation(new IntPoint(198, 260));
			tfAppearCondition.setSize(new IntDimension(198, 20));
			tfAppearCondition.setToolTipText("只有敌人类型是条件出现时，会有作用，'Kill@1'表示消灭第一个敌人后出现，'Turn@4'表示第4回合出现，'KillAll'表示全灭敌人后出现");
			
			label83 = new JLabel();
			label83.setLocation(new IntPoint(0, 364));
			label83.setSize(new IntDimension(146, 26));
			label83.setText("命中率");
			
			cHitRate = new JStepper();
			cHitRate.setLocation(new IntPoint(146, 336));
			cHitRate.setSize(new IntDimension(146, 24));
			cHitRate.setColumns(3);
			
			cbIsSummon = new JCheckBox();
			cbIsSummon.setLocation(new IntPoint(0, 280));
			cbIsSummon.setSize(new IntDimension(198, 20));
			cbIsSummon.setToolTipText("当关卡有召唤类型敌人时，该敌人回合开始时会召唤潜艇");
			cbIsSummon.setText("是否是召唤者");
			
			cbIsLineShoot = new JCheckBox();
			cbIsLineShoot.setLocation(new IntPoint(146, 364));
			cbIsLineShoot.setSize(new IntDimension(146, 26));
			cbIsLineShoot.setText("是否是下落子弹");
			
			btnSave = new JButton();
			btnSave.setLocation(new IntPoint(148, 280));
			btnSave.setSize(new IntDimension(148, 20));
			btnSave.setText("保存");
			
			//component layoution
			append(showPanel);
			append(panel42);
			append(panel26);
			
			panel42.append(panel51);
			panel42.append(panel52);
			
			panel51.append(label43);
			panel51.append(label45);
			panel51.append(label47);
			panel51.append(label49);
			
			panel52.append(equip1);
			panel52.append(equip2);
			panel52.append(equip3);
			panel52.append(equip4);
			
			panel26.append(label27);
			panel26.append(cbSubRes);
			panel26.append(label29);
			panel26.append(tfName);
			panel26.append(label55);
			panel26.append(cbExplodeRange);
			panel26.append(label31);
			panel26.append(cbAI);
			panel26.append(label33);
			panel26.append(cHP);
			panel26.append(label35);
			panel26.append(cATK);
			panel26.append(label37);
			panel26.append(cDEF);
			panel26.append(label39);
			panel26.append(cTATK);
			panel26.append(label42);
			panel26.append(tfXPos);
			panel26.append(label44);
			panel26.append(tfYPos);
			panel26.append(label51);
			panel26.append(tfSkill);
			panel26.append(label48);
			panel26.append(tfSkillAnime);
			panel26.append(label53);
			panel26.append(cHue);
			panel26.append(label57);
			panel26.append(cbEnemyType);
			panel26.append(label59);
			panel26.append(tfAppearCondition);
			panel26.append(label83);
			panel26.append(cHitRate);
			panel26.append(cbIsSummon);
			panel26.append(cbIsLineShoot);
			panel26.append(btnSave);
			
		}
		
		//_________getters_________
		
		public function getShowPanel():JPanel{
			return showPanel;
		}
		
		
		
		
		
		
		
		
		public function getEquip1():JComboBox{
			return equip1;
		}
		
		public function getEquip2():JComboBox{
			return equip2;
		}
		
		public function getEquip3():JComboBox{
			return equip3;
		}
		
		public function getEquip4():JComboBox{
			return equip4;
		}
		
		
		
		public function getCbSubRes():JComboBox{
			return cbSubRes;
		}
		
		
		public function getTfName():JTextField{
			return tfName;
		}
		
		
		public function getCbExplodeRange():JComboBox{
			return cbExplodeRange;
		}
		
		
		public function getCbAI():JComboBox{
			return cbAI;
		}
		
		
		public function getCHP():JStepper{
			return cHP;
		}
		
		
		public function getCATK():JStepper{
			return cATK;
		}
		
		
		public function getCDEF():JStepper{
			return cDEF;
		}
		
		
		public function getCTATK():JStepper{
			return cTATK;
		}
		
		
		public function getTfXPos():JTextField{
			return tfXPos;
		}
		
		
		public function getTfYPos():JTextField{
			return tfYPos;
		}
		
		
		public function getTfSkill():JTextField{
			return tfSkill;
		}
		
		
		public function getTfSkillAnime():JTextField{
			return tfSkillAnime;
		}
		
		
		public function getCHue():JStepper{
			return cHue;
		}
		
		
		public function getCbEnemyType():JComboBox{
			return cbEnemyType;
		}
		
		
		public function getTfAppearCondition():JTextField{
			return tfAppearCondition;
		}
		
		
		public function getCHitRate():JStepper{
			return cHitRate;
		}
		
		public function getCbIsSummon():JCheckBox{
			return cbIsSummon;
		}
		
		public function getCbIsLineShoot():JCheckBox{
			return cbIsLineShoot;
		}
		
		public function getBtnSave():JButton{
			return btnSave;
		}
		
		
	}
}
