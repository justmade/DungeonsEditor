package data
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.filesystem.File;
	
	public class SubResManager extends EventDispatcher
	{
		private static var _instance:SubResManager;
		
		private var files:Array = [];
		
		public var fileNames:Array = [];
		
		public function SubResManager(lock:Lock)
		{
			
		}
		
		public static function getInstance():SubResManager
		{
			if(_instance == null){
				_instance = new SubResManager(new Lock());
			}
			return _instance;
		}
		
		/**
		 * 初始化所有潜艇素材 
		 * 
		 */		
		public function init():void
		{
			var f:File = File.applicationDirectory;
			f = f.resolvePath("assets/subs");
			
			var a:Array = f.getDirectoryListing();
			for(var i:int = 0; i < a.length; i++)
			{
				var cf:File = a[i] as File;
				if(cf.extension == "swf"){
					files.push(cf);
					fileNames.push(cf.name.split(".")[0]);
				}
			}
		}
		
		public function getFileByRes(res:String):File
		{
			var index:int = fileNames.indexOf(res);
			if(index >= 0){
				return files[index] as File;
			}
			return null;
		}
	}
}class Lock{}