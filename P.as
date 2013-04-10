package  {
  
	import flash.display.Shape;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	
	public class P extends U {

		public function P(T:Function, u:Object, i:uint, j:uint, q:uint, s:Number, I:uint) {
			
			super(T, u, i, j, q, s, I);
			A = true;
			
		}
		
		public function s(){
			alpha = (alpha == 1)?.5:1;
			D();
			V();
		}
		
		override public function V(){
			var q:P = f.q;
			var v:P = f.v;
			f.b.draw(f.c, new Matrix(R/100, 0, 0, R/100, X, Y));
			f.g.fillRect(new Rectangle(0,0,70,50),0x00000000)
			f.g.draw(f.c, new Matrix(R/100*q.alpha, 0, 0, R/100*q.alpha, q.X+.5, q.Y+.5));
			f.g.draw(f.c, new Matrix(R/100*v.alpha, 0, 0, R/100*v.alpha, v.X+.5, v.Y+.5));
		}
	}
}
