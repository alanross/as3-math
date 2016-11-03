package tests.math
{
	import com.ar.math.Maths;

	import org.flexunit.Assert;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class TestMathBezierQuadratic
	{
		public function TestMathBezierQuadratic()
		{
		}

		[Test(description="")]
		public function bezierQuadraticTest():void
		{
			var expected:int = 0.0;
			var result:int = Maths.bezierQuadratic( 0.0, 0.0, 0.0, 0.0 );
			Assert.assertEquals( expected, result );
		}

		public function toString():String
		{
			return "[TestMathBezierQuadratic]";
		}
	}
}