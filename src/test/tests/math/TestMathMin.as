package tests.math
{
	import com.ar.math.Maths;

	import org.flexunit.Assert;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class TestMathMin
	{
		public function TestMathMin()
		{
		}

		[Test(description="")]
		public function test1():void
		{
			var expected:Number = 0.0;
			var result:Number = Maths.min( 0.0, 1.0 );
			Assert.assertEquals( expected, result );
		}

		public function toString():String
		{
			return "[TestMathMin]";
		}
	}
}