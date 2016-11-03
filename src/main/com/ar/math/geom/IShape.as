package com.ar.math.geom
{
	import com.ar.core.utils.IDisposable;

	import flash.geom.Point;
	import flash.geom.Rectangle;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public interface IShape extends IDisposable
	{
		/**
		 * Move the shape to given position.
		 */
		function moveTo( x:Number, y:Number ):void;

		/**
		 * Resize the shape to the new width and height values.
		 */
		function resizeTo( width:Number, height:Number ):void;

		/**
		 * Returns true if the shape contains the given x and y values, false otherwise.
		 */
		function contains( x:Number, y:Number ):Boolean;

		/**
		 * Return the bounds of the shape.
		 */
		function getBounds():Rect;
	}
}