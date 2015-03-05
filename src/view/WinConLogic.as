package view
{
	import flash.net.dns.AAAARecord;
	
	import org.aswing.ButtonGroup;

	/**
	 * 胜利条件相关数据界面的控制类
	 * 
	 * @author putao
	 * 
	 */	
	public class WinConLogic
	{
		public var skin:WinConEditor;
		
		private var btnGroup:ButtonGroup;
		
		public function WinConLogic()
		{
			init();
		}
		
		private function init():void
		{
			skin = new WinConEditor();
			
			btnGroup = new ButtonGroup();
			btnGroup.append(skin.getRAll());
			btnGroup.append(skin.getRKill());
			btnGroup.append(skin.getRMove());
		}
		/**
		 * 
		 * @param xml  胜利条件相关数据的xml
		 * 
		 */		
		public function setXML(xml:XML):void
		{
			if(xml.target.length() > 0){
				if(xml.target[0].@target == "kill"){
					skin.getRKill().setSelected(true);
					skin.getTfParams().setText(xml.target[0].@targetParameters);
				}else if(xml.target[0].@target == "moveToPlace"){
					skin.getRMove().setSelected(true);
					skin.getTfParams().setText(xml.target[0].@targetParameters);
				}else{
					skin.getRAll().setSelected(true);
					skin.getTfParams().setText("");
				}
			}
		}
		/**
		 * 
		 * @return 胜利条件相关数据的xml
		 * 
		 */		
		public function getXML():XML
		{
			var result:XML = <storyLine/>;
			var cxml:XML;
			var params:String = skin.getTfParams().getText();
			switch(btnGroup.getSelectedButton())
			{
				case skin.getRAll():
					cxml = <target target="killAll"/>;
					break;
				case skin.getRKill():
					cxml = <target target="kill" targetParameters={params}/>;
					break;
				case skin.getRMove():
					cxml = <target target="moveToPlace" targetParameters={params}/>;
					break;
			}
			if(cxml){
				result.appendChild(cxml);
				cxml = <win/>;
				result.appendChild(cxml);
			}
			return result;
		}
	}
}