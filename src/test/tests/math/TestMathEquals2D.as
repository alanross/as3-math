package tests.math
{
	import com.ar.math.Maths;

	import flash.geom.Point;

	import org.flexunit.Assert;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class TestMathEquals2D
	{
		public function TestMathEquals2D()
		{
		}

		[Test(description="")]
		public function test1():void
		{
			var expected:Boolean = true;
			var result:Boolean = Maths.equals2D( new Point( 1.0, 1.0 ), new Point( 1.0, 1.0 ), 0.0 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test2():void
		{
			var expected:Boolean = true;
			var result:Boolean = Maths.equals2D( new Point( 1.09, 1.0 ), new Point( 1.0, 1.0 ), 1.0 );
			Assert.assertEquals( expected, result );
		}

		public function toString():String
		{
			return "[TestMathEquals2D]";
		}
	}
}