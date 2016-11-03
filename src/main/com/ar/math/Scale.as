package com.ar.math
{
	import com.ar.core.error.ValueError;

	import flash.geom.Point;
	import flash.geom.Rectangle;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class Scale
	{
		public static const TYPE_FILL:int = 0;
		public static const TYPE_FIT:int = 1;
		public static const TYPE_STRETCH:int = 2;

		/**
		 * Returns the scale, whereas the scale.x is the horizontal scale and scale.y the vertical scale.
		 */
		public static function getScale( sw:Number, sh:Number, dw:Number, dh:Number, scaleType:int ):Point
		{
			if( scaleType == TYPE_FILL )
			{
				var ratioFill:Number = Math.max( dw / sw, dh / sh );

				return new Point( ratioFill, ratioFill );
			}
			else if( scaleType == TYPE_FIT )
			{
				var ratioFit:Number = Math.min( dw / sw, dh / sh );

				return new Point( ratioFit, ratioFit );
			}
			else if( scaleType == TYPE_STRETCH )
			{
				return new Point( (dw / sw), (dh / sh) );
			}

			throw new ValueError( "Scale type is unknown." );

			return null;
		}

		/**
		 * Returns a new rectangle holding the new width and height and a centered x/y relative to
		 * the given dest x/y.
		 */
		public static function getRect( source:Rectangle, dest:Rectangle, scaleType:int ):Rectangle
		{
			const result:Rectangle = new Rectangle();

			if( scaleType == TYPE_FILL )
			{
				var ratioFill:Number = Math.max( dest.width / source.width, dest.height / source.height );

				result.width = ratioFill * source.width;
				result.height = ratioFill * source.height;
			}
			else if( scaleType == TYPE_FIT )
			{
				var ratioFit:Number = Math.min( dest.width / source.width, dest.height / source.height );

				result.width = ratioFit * source.width;
				result.height = ratioFit * source.height;
			}
			else if( scaleType == TYPE_STRETCH )
			{
				result.width = ( dest.width / source.width ) * source.width;
				result.height = ( dest.height / source.height ) * source.height;
			}
			else
			{
				throw new ValueError( "Scale type is unknown." );
			}

			result.x = dest.x + ( dest.width - result.width ) * 0.5;
			result.y = dest.y + ( dest.height - result.height ) * 0.5;

			return result;
		}

		/**
		 * Creates a new instance of Scale.
		 */
		public function Scale()
		{
			throw new Error( "Scale is static container only." );
		}

		/**
		 * Generates and returns the string representation of the Scale object.
		 */
		public function toString():String
		{
			return "[Scale]";
		}
	}
}