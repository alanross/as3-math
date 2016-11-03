package com.ar.math.path.spline
{
	import com.ar.math.path.Path;

	import flash.display.Graphics;
	import flash.geom.Point;

	public class LinearSplinePath extends Path
	{
		protected var vertices:Vector.<Point>;
		protected var cues:Vector.<Number>;

		public function LinearSplinePath( vertices:Vector.<Point> )
		{
			setPoints( vertices );
		}

		public function setPoints( value:Vector.<Point> ):void
		{
			vertices = value;
			cues = new Vector.<Number>();

			var length:Number = 0.0;

			var lx:Number = vertices[0].x;
			var ly:Number = vertices[0].y;

			for( var i:int = 1; i < vertices.length - 1; ++i )
			{
				var x:Number = vertices[ i ].x;
				var y:Number = vertices[ i ].y;

				var dx:Number = x - lx;
				var dy:Number = y - ly;

				var segmentLength:Number = Math.sqrt( dx * dx + dy * dy );

				cues.push( segmentLength );

				length += segmentLength;

				lx = x;
				ly = y;
			}

			var marker:Number = 0.0;

			for( i = 0; i < cues.length; i++ )
			{
				cues[ i ] /= length;
				marker += cues[ i ];
				cues[ i ] = marker - cues[ i ];
			}
		}

		final override public function compute( t:Number, result:Point ):void
		{
			var n:int = cues.length;
			var index:int = n - 1;
			var weight:Number = 1.0 - cues[ index ];

			for( var i:int = 1; i < n; i++ )
			{
				if( cues[ i ] > t )
				{
					index = i - 1;
					weight = cues[ i ] - cues[ index ];
					break;
				}
			}

			t = ( t - cues[ index ] ) / weight;

			getPoint( index, t, result );
		}

		protected function getPoint( index:int, t:Number, result:Point ):void
		{
			const p0: Point = vertices[ index ];
			const p1: Point = vertices[ index + 1 ];

			result.x = p0.x + ( p1.x - p0.x ) * t;
			result.y = p0.y + ( p1.y - p0.y ) * t;
		}

		override public function interpolate( graphics:Graphics, resolution:int ):void
		{
			super.interpolate( graphics, resolution );

			var n:int = vertices.length;

			for( var i:int = 0; i < n - 1; ++i )
			{
				graphics.beginFill( 0x88FF00, 0.8 );
				graphics.drawCircle( vertices[ i ].x, vertices[ i ].y, 5 );
				graphics.endFill();
			}
		}

		override public function toString():String
		{
			return "[LinearSplinePath]";
		}
	}
}