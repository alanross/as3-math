package com.ar.math.geom
{
	/**
	 * Wrapper class to provide easy access to setting x, y, width and height values.
	 * Note that negative width and height values are converted to zero.
	 *
	 * @author Alan Ross
	 * @version 0.1
	 */
	public class Rect implements IShape
	{
		private var _x:Number;
		private var _y:Number;
		private var _width:Number;
		private var _height:Number;

		/**
		 * Creates a new instance of Rect.
		 */
		public function Rect( x:Number = 0.0, y:Number = 0.0, width:Number = 0.0, height:Number = 0.0 )
		{
			moveTo( x, y );
			resizeTo( width, height );
		}

		/**
		 * Set the x, y, width and height values of the Rectangle.
		 * Negative width or height values are converted to 0.0.
		 */
		public function setTo( x:Number, y:Number, width:Number, height:Number ):void
		{
			moveTo( x, y );
			resizeTo( width, height );
		}

		/**
		 * Set the width and height values of the Rectangle.
		 * Negative values are converted to 0.0
		 */
		public function resizeTo( width:Number, height:Number ):void
		{
			_width = ( 0 > width ) ? 0 : width;
			_height = ( 0 > height ) ? 0 : height;
		}

		/**
		 * @inheritDoc
		 */
		public function moveTo( x:Number, y:Number ):void
		{
			_x = x;
			_y = y;
		}

		/**
		 * @inheritDoc
		 */
		public function contains( x:Number, y:Number ):Boolean
		{
			return (x >= _x && x <= _x + _width && y >= _y && y <= _y + _height);
		}

		/**
		 * @inheritDoc
		 */
		public function getBounds():Rect
		{
			return this;
		}

		/**
		 * Frees all internal references of the object.
		 */
		public function dispose():void
		{
		}

		public function get x():Number
		{
			return _x;
		}

		public function set x( value:Number ):void
		{
			_x = value;
		}

		public function get y():Number
		{
			return _y;
		}

		public function set y( value:Number ):void
		{
			_y = value;
		}

		public function get width():Number
		{
			return _width;
		}

		public function set width( value:Number ):void
		{
			_width = ( 0 > value ) ? 0 : value;
		}

		public function get height():Number
		{
			return _height;
		}

		public function set height( value:Number ):void
		{
			_height = ( 0 > value ) ? 0 : value;
		}

		public function toString():String
		{
			return "[Rect" +
					", x: " + _x +
					", y: " + _y +
					", width: " + _width +
					", height: " + _height + "]";
		}
	}
}
