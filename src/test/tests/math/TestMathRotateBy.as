package tests.math
{
	import com.ar.math.Maths;

	import flash.geom.Point;

	import org.flexunit.Assert;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class TestMathRotateBy
	{
		public function TestMathRotateBy()
		{
		}

		[Test(description="")]
		public function rotateByTest():void
		{
			var expected:Point = new Point( 100, 6.123233995736766e-15 );
			var result:Point = new Point();

			Maths.rotateBy( 90, 100, result );

			Assert.assertEquals( true, Maths.equals( expected.x, result.x, 0.001 ) );
			Assert.assertEquals( true, Maths.equals( expected.y, result.y, 0.001 ) );
		}

		public function toString():String
		{
			return "[TestMathRotateBy]";
		}
	}
}