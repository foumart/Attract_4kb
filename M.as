package  {
  
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.geom.Matrix;
	
	import flash.events.KeyboardEvent;
	
	[SWF(width='700', height='500', backgroundColor='0x000000', frameRate='60')]
	
	public class M extends Sprite {
		
		var w:uint = 0;//	currentLevel
		var l:uint = 0;//	levelLoop
		var m:Array;//		gameMap
		var d:BitmapData;//	bgrBmp
		var r:BitmapData;//	bgrBmpGame
		var F:BitmapData;//	bgrFadeBmp
		var G:BitmapData;//	gameFadeBmp
		
		var g:Sprite;//		gameLayer
		var k:uint = 0;//	keyCode
		var h:Array;
		
		var q:P;//			player1
		var v:P;//			player2
		var a:uint;
		
		var B:Array;
		var f:Object;
		
		var c:Shape;
		
		var N:Array = [ 0xe,0x0,0x2,0x6,0x0,0x0,0xf,//],
								    0x0,0x0,0x6,0x1,0x6,0x2,0x3,//],
								    0x3,0x2,0x1,0x0,0x3,0x6,0x0,//],
									  0x0,0x0,0x4,0x8,0x3,0x0,0x0,//],
									  0xf,0x1,0x0,0x0,0x3,0x2,0xe,//]
								//],
								
								//level two
								//[
							      0x0,0xe,0x0,0x2,0x2,0x2,0x2,//],
							      0x0,0xf,0x0,0x3,0xa,0x3,0xf,//],
							      0x1,0x2,0x1,0x2,0x1,0x2,0x4,//],
							      0x3,0x9,0x3,0x0,0x1,0x1,0x8,//],
							      0x1,0x2,0x1,0xe,0x3,0x0,0x1,//]
								//],
								
								// level three
								//[
						        0x0,0x0,0x2,0xf,0x2,0x0,0x2,//],
							      0x0,0x1,0x7,0x1,0x0,0x1,0x7,//],
						    	  0x0,0x6,0x0,0x4,0x8,0xe,0x2,//],
							      0x0,0x1,0x6,0x2,0x0,0x3,0xf,//],
							      0x0,0xe,0x2,0x3,0x0,0x9,0x0,//]
								//],
								
								// boss level
								//[
								 	0xe,0x2,0x0,0x4,0x1,0x0,0x0,//],
									0x0,0x3,0x6,0x2,0x7,0x1,0x2,//],
									0x3,0x2,0x1,0xd,0xa,0x3,0x2,//],
									0x0,0x0,0x0,0x1,0x2,0x1,0x2,//],
									0x0,0xa,0x1,0x1,0x4,0x3,0xe,//]
								//]
							];
		
		public function M() {
			
			//trace("Attract 4kb © by FoumartGames 02-05~30 Aug 2012\nwww.foumartgames.com || inthewoodsbg (at) gmail")
			//trace("controls:ARROWS[move], SPACE[switch], R[restart]")
			
			super();
			
			blendMode = "layer";
			
			Z();
		}
		
		function Z(){
			
			h = [];
			m = [];
			B = [];
			q = null;
			v == null;
			for(var i:uint = 0; i < 70; i ++){
				m.push(new Array(70));
			}
			
			d = new BitmapData(70, 50, false, 0x0c1e41);
			var b:Bitmap = new Bitmap(d);
			b.width = 700;
			b.height = 500;
			addChild(b);
			
			F = new BitmapData(70, 50, true, (l==0||w==3&&l!=2)?0x66000000:0);
			b = new Bitmap(F);
			b.alpha = .5;
			b.width = 700;
			b.height = 500;
			addChild(b);
			b.blendMode = "alpha";
			
			g = new Sprite();
			g.blendMode = "layer";
			addChild(g);
			
			G = new BitmapData(70, 50, true);
			b = new Bitmap(G);
			b.width = 700;
			b.height = 500;
			g.addChild(b);
			b.blendMode = "alpha";
			
			c = new Shape();
			c.graphics.beginFill(0x0, 1);
			c.graphics.drawCircle(0,0,100)
			//c.graphics.endFill();
			
			f = {m:m, b:F, g:G, c:c, o:B}
			
			I();
			
			r = d.clone();
			b = new Bitmap(r);
			b.width = 700;
			b.height = 500;
			g.addChildAt(b, 0)
			
			f.q = q;
			f.v = v;
			
			a = 2;
			
			q.s();
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, D, false);
			stage.addEventListener(KeyboardEvent.KEY_UP, K, false);
		}
		
		function L():P{
			return (a==1)?q:v;
		}
		
		public function R(n:Boolean = false){
			if(n){
				w++;
				if(w > 2+l || w > 3){
					l++;
					w = 0;
				}
			}
			for(var i:int = numChildren-1; i>=0; i--){
				removeChildAt(i);
			}
			if(l==3)dispatchEvent(new Event("complete")) else Z();
		}
		
		function D(C:KeyboardEvent) {//detectKey
			k = C.keyCode;
			if(k == 78 && h.indexOf(39) != -1){
				R(true);
			}
			if(k == 82){
				R();
			}
			if(k == 81){
				l = 0; w = 0;
				R();
			}
			if(h.indexOf(k) == -1){
				h.push(k);
			}
			if(k == 32){
				L().s();
				a = (a == 1) ? 2 : 1;
				L().s();
			}
			addEventListener(Event.ENTER_FRAME, H);
			X(k);
		}
		function H(evt:Event){
			X(k);
		}
		function X(k:uint){
			if(k > 36 && k < 41){
				L().M(k);
			}
		}
		
		function K(e:KeyboardEvent) {
			if(h.indexOf(e.keyCode) != -1){
				h.splice(h.indexOf(e.keyCode), 1)
			}
			if(h.length > 0){
				k = h[h.length-1]
				X(k);
			} else {
				removeEventListener(Event.ENTER_FRAME, H);
			}
		}
		
		function I(){
			var i:uint;
			var j:uint;
			var n:uint;
			for(i = 0; i < 70; i ++){
				W(0, i); W(69, i); W(i, 0); W(i, 49);
			}
			for(n = w*35; n < (w+1)*35; n++){
				i = (n-w*35);
				j = i/7;
				i = i-j*7;
				switch(N[n]){
					case 0x0:
						break;
					case 0x1:
						U(i, j);
					case 0x2:
						V(i, j);
						break;
					case 0x3:
						U(i, j);
						break;
					case 0xe:
						if(l>0)Q(i, j);
						break;
					case 0xf:
						if(l==0)Q(i, j);
						break;
					default:
						E(i, j, (N[n] == 8 && l==2) ? N[n]+1 : N[n]);
						break;
				}
			}
		}
		function W(X:int, Y:int){
			var A:Array = [0x85b2cd, 0x4b8387, 0x2f4a60, 0x4380b3, 0x4a47a2, 0x3f1d52];
			
			d.setPixel(X+1, Y, A[(w+l)]<<(uint(l/2)*20));
			d.setPixel(X-1, Y, A[(w+l)]<<(uint(l/2)*20));
			
			d.setPixel(X, Y+1, A[(w+1+l)]<<(uint(l/2)*19));
			d.setPixel(X, Y-1, A[(w+1+l)]<<(uint(l/2)*19));
			
			if(X>0) m[Y][X-1] = 1;
			if(X<69) m[Y][X+1] = 1;
			if(Y<49) m[Y+1][X] = 1;
			if(Y>0) m[Y-1][X] = 1;
		}
		function U(X:int, Y:int){
			for(var i:uint = X*10+1; i < X*10+10; i++){
				W(i, Y*10);
			}
		}
		function V(X:int, Y:int){
			for(var i:uint = Y*10+1; i < Y*10+10; i++){
				W(X*10, i);
			}
		}
		
		function E(X:uint, Y:uint, Z:uint){
			if(Z>5||l>0){
				var r:uint = (Z-6) * 1.5;
				var t:BitmapData = new BitmapData(70, 50, false, 0xffffff);
				t.draw(c, new Matrix(0.05 + r/50, 0, 0, 0.05 + r/50, X*10 + .5, Y*10 + 5.5));
				for(var i:uint = 0; i < 50; i ++){
					for(var j:uint = 0; j < 70; j ++){
						if(d.getPixel(j, i) == 0x0c1e41){
							if(t.getPixel(j, i) == 0x0){
								d.setPixel(j, i, 0x400000);
								m[i][j] = 2;
							} else if(t.getPixel(j, i) != 0xffffff){
								d.setPixel(j, i, 0x550000);
								m[i][j] = 3;
							}
						}
					}
				}
				var o:O = new O(R, f, X*10, Y*10+5, Z, 6 - l, 0xff0000, Z-4);
				g.addChildAt(o, g.numChildren-1);
				B.push(o);
				o.T();
			}
		}
		
		function Q(X:uint, Y:uint){
			var p:P = new P(R, f, X*10+5, Y*10+5, 16 - l*2, 6 - (l/4)*3, 0x00ff00);
			g.addChildAt(p, g.numChildren-1);
			if(q)v = p else q = p;
			
		}
	}
}
