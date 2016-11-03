package tests.math
{
	import com.ar.math.Maths;

	import org.flexunit.Assert;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class TestMathMax
	{
		public function TestMathMax()
		{
		}

		[Test(description="")]
		public function test1():void
		{
			var expected:Number = 1.0;
			var result:Number = Maths.max( 0.0, 1.0 );
			Assert.assertEquals( expected, result );
		}

		public function toString():String
		{
			return "[TestMathMax]";
		}
	}
}