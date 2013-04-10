package  {
  
	import flash.display.Shape;
	import flash.events.Event;
	
	public class U extends Shape {
		
		public var A:Boolean;
		
		public var X:uint;
		public var Y:uint;
		public var R:uint;
		public var t:int;
		
		public var p:Number;
		public var v:uint;
		public var m:Array;
		public var e:uint = 0;
		public var f:Object;
		
		public var l:uint;
		
		public var r:Function;
		
		public var w:Boolean;
		
		public var k:Boolean;
		
		public var hps:int = 100;
		
		public function U(T:Function, u:Object, i:uint, j:uint, q:uint, s:Number, I:uint) {
			
			super();
			
			r = T;
			f = u;
			
			x = i*10;
			y = j*10;
			
			m = u.m;
			p = s;
			
			X = i;
			Y = j;
			R = q;
			
			l = I;
			
			D();
		}
		
		public function I(p:uint):uint{
			if(p>39||p<37) return X else return X+p-38;
		}
		
		public function J(p:uint):uint{
			if(p<38) return Y else return Y+p-39;
		}
		
		public function M(p:uint){
			if(v==0 && a(p, true)){
				V();
				v = p;
				addEventListener(Event.ENTER_FRAME, N);
			}
			
		}
		
		public function a(p:uint, a:Boolean = false):Boolean{
			if((A) ? m[J(p)][I(p)] != 1 : (m[J(p)][I(p)] == 2)){
				if(a){
					X = I(p);
					Y = J(p);
				}
				return true;
			} else {
				return false;
			}
		}
		
		public function N(S:Event){
			if(k){
				scaleX+=.1;
				scaleY=scaleX;
				x-=1/2;
				y-=1/2;
				alpha -=1/50;
				if(alpha <= 0){
					removeEventListener(Event.ENTER_FRAME, N);
					r(w);
					w = false;
				}
			} else {
				x += ((I(v) - X)*10)/p;
				y += ((J(v) - Y)*10)/p;
				
				e ++;
				
				if(e >= p){
					x = X*10;
					y = Y*10;
					removeEventListener(Event.ENTER_FRAME, N);
					e = 0;
					v = 0;
					t = (m[Y][X] - 1);
					if(t < 0) t=0;
				}
			}
		}
		
		public function D(){
			graphics.clear();
			graphics.beginFill(l, 1/4);
			graphics.drawCircle(5,5,20);
			graphics.beginFill(l, 1/6);
			graphics.drawCircle(5,5,20);
			graphics.drawCircle(5,5,12+((100-hps)/14));
			graphics.beginFill(l, 2/3);
			graphics.drawCircle(5,5,12);
			graphics.beginFill(l, 1);
			graphics.drawRect(-4*(alpha - 1),-4*(alpha - 1),10+8*(alpha - 1),10+8*(alpha - 1));
		}
		
		public function V(){
			
		}
		public function K(G:Number){
			if(G==-1){
				hps =0;
			} else {
				hps -= 4-G;
			}
			
			if(hps<=0){
				addEventListener(Event.ENTER_FRAME, N);
				//if(!hasEventListener(Event.ENTER_FRAME))addEventListener(Event.ENTER_FRAME, N);
				v = 1;
				k = true;
			} else {
				D()
			}
		}
		
	}
	
}
