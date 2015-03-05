package data
{
	public class HitCheckType
	{
		private static var objs:Array = [];
		
		/**
		 * 初始化敌人的碰撞区域
		 * 
		 */		
		public static function init():void
		{
			addObj("YiJiShouWei", "bmarman");
			addObj("YeZhu", "mbig");
			addObj("TaoZi", "normal");
			addObj("TanSuoZhe", "normal");
			addObj("SiShen", "mbig");
			addObj("ShuiMu", "normal");
			addObj("ShiTouXiaoGuai", "smarman");
			addObj("ShaYuDuiZhang", "shayuduizhang");
			addObj("RenYuBoss", "ssmarman");
			addObj("RenYuBing", "smarman");
			addObj("QiE", "normal");
			addObj("NvRenYu", "smarman");
			addObj("NanRenYu", "smarman");
			addObj("NSHSG", "mbig", 50, 0);
			addObj("MaMian", "smarman");
			addObj("LongXia", "smarman");
			addObj("LaSaLuSi", "ssmarman");
			addObj("LaSaErTe", "shayuduizhang");
			addObj("LaSaDeLa", "ssmarman", 80, -50);
			addObj("KaiJiaZaBing", "smarman");
			addObj("JuShenBingZuoShou", "normal");
			addObj("JuShenBingYouShou", "normal");
			addObj("JuShenBing", "bmarman");
			addObj("HongSeGuaiYu", "normal");
			addObj("HeTun", "msmall");
			addObj("HaiMa", "smarman");
			addObj("HaiGui", "normal");
			addObj("FeiFeiYu", "ssbig");
			addObj("DouDing", "smarman");//豆丁
			addObj("DengLongYu", "normal");//灯笼鱼
			addObj("BuLuTuo", "msmall", -50, 0);
			
		}
		
		public static function getHitRes(res:String):String
		{
			for(var i:int = 0; i < objs.length; i++)
			{
				var obj:MObj = objs[i] as MObj;
				if(obj.res == res){
					return obj.hitObj;
				}
			}
			return "";
		}
		
		/**
		 *　添加一个敌人的碰撞区域 
		 * @param res 敌人的素材地址
		 * @param hitObj 敌人的碰撞区域，对应submarines.fla里的库
		 * @param shootX 敌人射击时的发射点对于中心点的相对坐标
		 * @param shootY 敌人射击时的发射点对于中心点的相对坐标
		 * 
		 */		
		private static function addObj(res:String, hitObj:String, shootX:int = 0, shootY:int = 0):void
		{
			objs.push(new MObj(res, hitObj, shootX, shootY));
		}
		
		public static function getShootXY(res:String):Array
		{
			for(var i:int = 0; i < objs.length; i++)
			{
				var obj:MObj = objs[i] as MObj;
				if(obj.res == res){
					return [obj.shootX, obj.shootY];
				}
			}
			return [0, 0];
		}
	}
}
class MObj
{
	public var res:String;
	
	public var hitObj:String;
	
	public var shootX:int = 0;
	
	public var shootY:int = 0;
	
	public function MObj(res:String, hitObj:String, shootX:int = 0, shootY:int = 0)
	{
		this.res = res;
		this.hitObj = hitObj;
		this.shootX = shootX;
		this.shootY = shootY;
	}
}