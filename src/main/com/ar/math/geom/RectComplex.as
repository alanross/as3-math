package com.ar.math.geom
{
	import flash.geom.Matrix;
	import flash.geom.Point;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class RectComplex implements IShape
	{
		public const bl:Point2D = new Point2D();
		public const tl:Point2D = new Point2D();
		public const tr:Point2D = new Point2D();
		public const br:Point2D = new Point2D();

		private var _points:Vector.<Point2D>;
		private var _bounds:Rect;

		private var _x:Number;
		private var _y:Number;
		private var _width:Number;
		private var _height:Number;

		private var _dirtyBounds:Boolean;

		/**
		 * Creates a new instance of RectComplex.
		 */
		public function RectComplex( x:Number = 0.0, y:Number = 0.0, width:Number = 0.0, height:Number = 0.0 )
		{
			_points = new Vector.<Point2D>( 4, true );
			_points[0] = bl;
			_points[1] = tl;
			_points[2] = tr;
			_points[3] = br;

			_bounds = new Rect();

			setDimensions( x, y, width, height );
		}

		/**
		 * Reset.
		 */
		public function clear():void
		{
			_x = 0;
			_y = 0;
			_width = 0;
			_height = 0;

			bl.x = 0.0;
			bl.y = 0.0;
			tl.x = 0.0;
			tl.y = 0.0;
			tr.x = 0.0;
			tr.y = 0.0;
			br.x = 0.0;
			br.y = 0.0;

			_dirtyBounds = true;
		}

		/**
		 * Define the rectangle by its coordinate and size.
		 */
		public function setDimensions( x:Number, y:Number, width:Number, height:Number ):void
		{
			if( width < 0 )
			{
				width = 0;
			}

			if( height < 0 )
			{
				height = 0;
			}

			_x = x;
			_y = y;
			_width = width;
			_height = height;

			bl.x = x;
			bl.y = y + height;

			tl.x = x;
			tl.y = y;

			tr.x = x + width;
			tr.y = y;

			br.x = x + width;
			br.y = y + height;

			_dirtyBounds = true;
		}

		/**
		 * @inheritDoc
		 */
		public function moveTo( x:Number, y:Number ):void
		{
			_x = x;
			_y = y;

			bl.x = x;
			bl.y = y + height;

			tl.x = x;
			tl.y = y;

			tr.x = x + width;
			tr.y = y;

			br.x = x + width;
			br.y = y + height;

			_dirtyBounds = true;
		}

		/**
		 * @inheritDoc
		 */
		public function resizeTo( width:Number, height:Number ):void
		{
			if( width < 0 )
			{
				width = 0;
			}

			if( height < 0 )
			{
				height = 0;
			}

			_width = width;
			_height = height;

			bl.y = y + height;

			tr.x = x + width;

			br.x = x + width;
			br.y = y + height;

			_dirtyBounds = true;
		}

		/**
		 * Scale the rectangle.
		 */
		public function scaleTo( scaleX:Number, scaleY:Number ):void
		{
			bl.x = ( _x ) * scaleX;
			bl.y = ( _y + _height ) * scaleY;
			tl.x = ( _x ) * scaleX;
			tl.y = ( _y ) * scaleY;
			tr.x = ( _x + _width ) * scaleX;
			tr.y = ( _y ) * scaleY;
			br.x = ( _x + _width ) * scaleX;
			br.y = ( _y + _height ) * scaleY;

			_dirtyBounds = true;
		}

		/**
		 * Rotate the rectangle by given radian value.
		 */
		public function rotateBy( radian:Number, pivot:Point2D = null ):void
		{
			var dx:Number = 0.0;
			var dy:Number = 0.0;

			if( pivot != null )
			{
				dx = _x - pivot.x;
				dy = _y - pivot.y;
			}

			const blX:Number = dx;
			const blY:Number = dy + _height;

			const tlX:Number = dx;
			const tlY:Number = dy;

			const trX:Number = dx + _width;
			const trY:Number = dy;

			const brX:Number = dx + _width;
			const brY:Number = dy + _height;

			const sin:Number = Math.sin( radian );
			const cos:Number = Math.cos( radian );

			dx = _x - dx;
			dy = _y - dy;

			bl.setTo( cos * blX - sin * blY + dx, sin * blX + cos * blY + dy );
			tl.setTo( cos * tlX - sin * tlY + dx, sin * tlX + cos * tlY + dy );
			tr.setTo( cos * trX - sin * trY + dx, sin * trX + cos * trY + dy );
			br.setTo( cos * brX - sin * brY + dx, sin * brX + cos * brY + dy );

			_dirtyBounds = true;
		}

		/**
		 * Transform the offset, scale and rotation of the rectangle
		 */
		public function transformAll( offset:Point2D, scale:Point2D, radian:Number, pivot:Point2D ):void
		{
			var dx:Number = offset.x - pivot.x;
			var dy:Number = offset.y - pivot.y;

			const blX:Number = ( bl.x + dx ) * scale.x;
			const blY:Number = ( bl.y + dy ) * scale.y;

			const tlX:Number = ( tl.x + dx ) * scale.x;
			const tlY:Number = ( tl.y + dy ) * scale.y;

			const trX:Number = ( tr.x + dx ) * scale.x;
			const trY:Number = ( tr.y + dy ) * scale.y;

			const brX:Number = ( br.x + dx ) * scale.x;
			const brY:Number = ( br.y + dy ) * scale.y;

			const sin:Number = Math.sin( radian );
			const cos:Number = Math.cos( radian );

			dx = offset.x - dx;
			dy = offset.y - dy;

			bl.setTo( cos * blX - sin * blY + dx, sin * blX + cos * blY + dy );
			tl.setTo( cos * tlX - sin * tlY + dx, sin * tlX + cos * tlY + dy );
			tr.setTo( cos * trX - sin * trY + dx, sin * trX + cos * trY + dy );
			br.setTo( cos * brX - sin * brY + dx, sin * brX + cos * brY + dy );

			_x = tl.x;
			_y = tl.y;
			_width = tr.x - tl.x;
			_height = bl.y - tl.y;

			_dirtyBounds = true;
		}

		/**
		 * Use given matrix to manipulate the offset, scale and rotation of the rectangle.
		 */
		public function transform( matrix:Matrix ):void
		{
			var p:Point = new Point();

			p.setTo( tl.x, tl.y );
			p.copyFrom( matrix.transformPoint( p ) );
			tl.setTo( p.x, p.y );

			p.setTo( tr.x, tr.y );
			p.copyFrom( matrix.transformPoint( p ) );
			tr.setTo( p.x, p.y );

			p.setTo( bl.x, bl.y );
			p.copyFrom( matrix.transformPoint( p ) );
			bl.setTo( p.x, p.y );

			p.setTo( br.x, br.y );
			p.copyFrom( matrix.transformPoint( p ) );
			br.setTo( p.x, p.y );

			_dirtyBounds = true;
		}

		/**
		 * @inheritDoc
		 */
		public function contains( x:Number, y:Number ):Boolean
		{
			var inside:Boolean = false;
			var n:int = _points.length;

			var j:int = 0;

			var pi:Point2D;
			var pj:Point2D;

			for( var i:int = 0; i < n; i++ )
			{
				j++;

				if( j == n )
				{
					j = 0;
				}

				pi = _points[i];
				pj = _points[j];

				if( pi.y < y && pj.y >= y || pj.y < y && pi.y >= y )
				{
					if( pi.x + (y - pi.y) / (pj.y - pi.y) * (pj.x - pi.x) < x )
					{
						inside = !inside;
					}
				}
			}

			return inside;
		}

		/**
		 * Returns true if the rectangle contains the given point.
		 */
		public function containsPoint2D( p:Point2D ):Boolean
		{
			return contains( p.x, p.y );
		}

		/**
		 * @inheritDoc
		 */
		public function getBounds():Rect
		{
			if( !_dirtyBounds )
			{
				return _bounds;
			}

			var xMin:Number = Number.MAX_VALUE;
			var xMax:Number = Number.MIN_VALUE;

			var yMin:Number = Number.MAX_VALUE;
			var yMax:Number = Number.MIN_VALUE;

			var p:Point2D;

			for( var i:int = 0; i < _points.length; ++i )
			{
				p = _points[i];

				if( p.x < xMin )
				{
					xMin = p.x;
				}
				if( p.x > xMax )
				{
					xMax = p.x;
				}
				if( p.y < yMin )
				{
					yMin = p.y;
				}
				if( p.y > yMax )
				{
					yMax = p.y;
				}
			}

			_bounds.x = xMin;
			_bounds.y = yMin;
			_bounds.width = xMax - xMin;
			_bounds.height = yMax - yMin;

			_dirtyBounds = false;

			return _bounds;
		}

		/**
		 * Frees all internal references of the object.
		 */
		public function dispose():void
		{
			_bounds = null;

			_dirtyBounds = false;
		}

		/**
		 * The X coordinate of the rectangle.
		 */
		public function get x():Number
		{
			return _x;
		}

		/**
		 * The Y coordinate of the rectangle.
		 */
		public function get y():Number
		{
			return _y;
		}

		/**
		 * The width of the rectangle.
		 */
		public function get width():Number
		{
			return _width;
		}

		/**
		 * The height of the rectangle.
		 */
		public function get height():Number
		{
			return _height;
		}

		/**
		 * Creates and returns a string representation of the RectComplex object.
		 */
		public function toString():String
		{
			return "[RectComplex]";
		}
	}
}