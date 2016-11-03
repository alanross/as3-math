package tests.math
{
	import com.ar.math.Maths;

	import org.flexunit.Assert;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class TestMathBezierCubic
	{
		public function TestMathBezierCubic()
		{
		}

		[Test(description="")]
		public function bezierCubicTest():void
		{
			var expected:int = 0.0;
			var result:int = Maths.bezierCubic( 0.0, 0.0, 0.0, 0.0, 0.0 );
			Assert.assertEquals( expected, result );
		}

		public function toString():String
		{
			return "[TestMathBezierCubic]";
		}
	}
}