package  {
  
	import flash.events.Event;
	import flash.geom.Point;
	
	public class O extends U {
		
		var W:uint;
		var G:P;
		
		public function O(T:Function, u:Object, i:uint, j:uint, q:uint, s:Number, I:uint, Y:uint) {
			W = Y;
			super(T, u, i, j, q, s, I);
			addEventListener(Event.REMOVED_FROM_STAGE, Z);
		}
		
		private function Z(e:Event){
			removeEventListener(Event.ENTER_FRAME, H);
		}
		
		public function T(){
			addEventListener(Event.ENTER_FRAME, H);
		}
		
		public function n(m:Number):Number{
			return Math.random()* m;
		}
		
		public function H(t:Event){
			var q:P = f.q;
			var v:P = f.v;
			
			var r:Number = 0;
			var l:Number = 0;
			var d:Number = 0;
			var u:Number = 0;
			
			if(Point.distance(new Point(q.X, q.Y), new Point(v.X, v.Y)) < 1){
				q.w = true;
				q.K(0);
			}
			
			var Q:Number = Point.distance(new Point(q.X, q.Y), new Point(X, Y));
			var V:Number = Point.distance(new Point(v.X, v.Y), new Point(X, Y));
			
			if(Q < 3.5){
				q.K(Q);
			}
			if(V < 3.5){
				v.K(V);
			}
			var E:int;
			var F:int;
			
			if(q.t){
				if(v.t && v.alpha==1){
					G = v;
				} else {
					G = q;
				}
			} else if(v.t){
				if(q.t && q.alpha==1){
					G = q;
				} else {
					G = v;
				}
			} else {
				G = (Q > V) ? v : q;
			}
			
			E = G.X - X;
			F = G.Y - Y;
			
			if(Math.abs(E) > Math.abs(F)){
				u += n(12);
				d += n(12);
				if(E < 0) l += 12 + n(6) else r += 12 + n(6);
				if(F < 0 && F > -12) u += 12 + F else if(F > 0 && F < 12) d += 12 - F;
			} else {
				l += n(12);
				r += n(12);
				if(F < 0) u += 12 + n(6) else d += 12 + n(6);
				if(E < 0 && E > -12) l += 12 + E else if(E > 0 && E < 12) r += 12 - E;
			}
			
			E = 0;
			while(E == 0){
				if(Math.max(l,r,d,u) == l){
					if(C(37) && l > 9) E = 37 else l=0;
				} else if(Math.max(l,r,d,u) == r){
					if(C(39) && r > 9) E = 39 else r=0;
				} else if(Math.max(l,r,d,u) == u){
					if(C(38) && u > 9) E = 38 else u=0;
				} else if(Math.max(l,r,d,u) == d){
					if(C(40) && d > 9) E = 40 else d=0;
				}
				if(Math.max(l,r,d,u)==0)E=1;
			}
			M(E);
			
		}
		public function C(p:uint):Boolean{
			var w:Array = f.o;
			for(var B:uint = 0; B < w.length; B++){
				if(Point.distance(new Point(w[B].X, w[B].Y), new Point(I(p), J(p))) < 2 && w[B] != this){
					return false;
				}
			}
			return a(p);
		}
		
	}
	
}
